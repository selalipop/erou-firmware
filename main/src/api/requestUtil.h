#pragma once
#include "ESPAsyncWebServer.h"
#include "cjson_util.h"
#include "mjson.h"

using DoubleParam = std::pair<const char *, double *>;
using IntParam = std::pair<const char *, int *>;
using ShortStringParam = std::pair<const char *, ShortString *>;
using LongStringParam = std::pair<const char *, LongString *>;
using BoolParam = std::pair<const char *, bool *>;

template<class T, class F, class...Args>
static std::vector<T> accumulateParams(F f, Args &&...args) {
  std::vector<T> result = {f(std::forward<Args>(args)) ...};
  return result;
}

template<typename... Params>
static std::vector<const char *> getJsonParams(JsonObject *json, Params... params) {
  auto missingParams = accumulateParams<const char *>([=](auto ret) -> const char * {

    if constexpr(std::is_same<decltype(ret), DoubleParam>() ||
        std::is_same<decltype(ret), IntParam>() ||
        std::is_same<decltype(ret), BoolParam>() ||
        std::is_same<decltype(ret), ShortStringParam>() ||
        std::is_same<decltype(ret), LongStringParam>()) {
      auto[param, value] = ret;
      JsonVariant found = json->getMember(param);
      if (found.isNull() || found.isUndefined()) {
        return param; //Returns parameter name when it's missing
      }

      if constexpr(std::is_same<decltype(ret), ShortStringParam>()) {
        *value = ShortString(found.as<const char*>());
      } else if constexpr(std::is_same<decltype(ret), LongStringParam>()) {
        *value = LongString(found.as<const char*>());
      } else {
        *value = found;
      }
      return nullptr;
    }
    return nullptr;
  }, params...);

  missingParams.erase(std::remove_if(missingParams.begin(), missingParams.end(), [](const auto a) {
    return a == nullptr;
  }), missingParams.end());
  return missingParams;
}

template<typename... Params>
static std::vector<const char *> getJsonParams(mg_str *str, Params... params) {
  return getJsonParams<decltype(params)...>(str->ptr, str->len, params...);
}
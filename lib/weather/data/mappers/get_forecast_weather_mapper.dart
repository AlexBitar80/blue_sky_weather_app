import '../../../blue_sky.dart';

class GetForecastWeatherMapper {
  static ForecastWeatherResponseModel toEntity(
    ForecastWeatherResponseEntity entity,
  ) {
    return ForecastWeatherResponseModel(
      weather: [
        ForecastWeatherModel(
          main: entity.weather.main,
          description: entity.weather.description,
        ),
      ],
      main: MainInfoModel(
        temp: entity.main.temp,
        feelsLike: entity.main.feelsLike,
        tempMin: entity.main.tempMin,
        tempMax: entity.main.tempMax,
        humidity: entity.main.humidity,
      ),
      wind: ForecastWindModel(
        speed: entity.wind.speed,
        deg: entity.wind.deg,
        gust: entity.wind.gust,
      ),
      date: entity.date,
    );
  }

  static ForecastWeatherResponseEntity toModel(
      ForecastWeatherResponseModel model) {
    return ForecastWeatherResponseEntity(
      weather: ForecastWeatherEntity(
        main: model.weather.first.main,
        description: model.weather.first.description,
      ),
      main: MainInfoEntity(
        temp: model.main.temp,
        feelsLike: model.main.feelsLike,
        tempMin: model.main.tempMin,
        tempMax: model.main.tempMax,
        humidity: model.main.humidity,
      ),
      wind: ForecastWindEntity(
        speed: model.wind.speed,
        deg: model.wind.deg,
        gust: model.wind.gust,
      ),
      date: model.date,
    );
  }
}

import '../../../blue_sky.dart';

class GetWeatherMapper {
  static WeatherResponseModel toEntity(WeatherResponseEntity entity) {
    return WeatherResponseModel(
      weather: [
        WeatherModel(
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
      name: entity.name,
      wind: WindModel(
        speed: entity.wind.speed,
        deg: entity.wind.deg,
      ),
    );
  }

  static WeatherResponseEntity toModel(WeatherResponseModel model) {
    return WeatherResponseEntity(
      weather: WeatherEntity(
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
      name: model.name,
      wind: WindEntity(
        speed: model.wind.speed,
        deg: model.wind.deg,
      ),
    );
  }
}

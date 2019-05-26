import requests
from json import loads


def transCode(str):
    s = str.encode('ISO-8859-1')
    return s.decode('utf-8')


def main():
    resp = requests.get('http://api.jirengu.com/getWeather.php')
    json = loads(resp.text)
    beijing = json['results'][0]
    weather_data = beijing['weather_data']
    for item in weather_data:
        date = transCode(item['date'])
        weather = transCode(item['weather'])
        temperature = transCode(item['temperature'])
        print(date, weather, temperature)


if __name__ == '__main__':
    main()

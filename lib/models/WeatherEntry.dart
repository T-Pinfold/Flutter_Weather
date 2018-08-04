
class WeatherEntry {

String description = '';
double temperature = 0.0;
int pressure = 0;
int humidity = 0;
int high = 0;
int low = 0;

void setTemperature(double newTemperature) {
    temperature = newTemperature;
}

void setPressure(int newPressure) {
    pressure = newPressure;
}

void setHumidity(int newHumidity) {
    humidity = newHumidity;
}

void setHigh(int newHigh) {
    high = newHigh;
}

void setLow(int newLow) {
    low = newLow;
}
}
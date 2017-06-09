#include "m2.h"

float sphereVolume(float radius){
    return M_PI*(4.0/3.0)*pow(radius,3);
}

float rectangleVolume(float side){
    return pow(side,3);
}

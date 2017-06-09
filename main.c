#include "main.h"

#define VALUES_SIZE 4


int main(void){
    float values[VALUES_SIZE]={3.3, 4.5, 1.4, 10.4};
    
    printf("\n%s\n", "Calculate geometrical values");
    for(int i=0;i<VALUES_SIZE;i++){
        printf("%s%f%10.3f\n", "Circle area r=", values[i], circleArea(values[i]));
        printf("%s%f%10.3f\n", "Rectangle area side=", values[i], rectangleArea(values[i]));
        printf("%s%f%10.3f\n", "Sphere volume r=", values[i], sphereVolume(values[i]));
        printf("%s%f%10.3f\n", "Rectangle volume r=", values[i], rectangleVolume(values[i]));
    }      
    
    return 0; 
}

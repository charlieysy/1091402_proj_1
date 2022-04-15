# 1091402_proj_1
110-2 ALCO Project 1  
  
按照以下function輸出對應結果  

![latex](https://latex.codecogs.com/png.image?%5Cdpi%7B110%7DF(x)=%5Cbegin%7Bcases%7D%20&%20%7B2%5Ccdot%20x&plus;F(%5Cfrac%7Bx%7D%7B5%7D),%7D%20x%3E20%20%5C%5C%20&%20%5Ctext%7B%20F(x-2)&plus;F(x-3),%20%7D%2010%3Cx%5Cleq%2020%20%5C%5C%20&%20%5Ctext%7B%20F(x-1)&plus;F(x-2),%20%20%7D%201%3Cx%5Cleq%2010%20%5C%5C%20&%20%5Ctext%7B%201,%20%7D%20x=0%20%5C%5C%20&%20%5Ctext%7B%205,%20%7D%20x=1%20%5C%5C%20&%20%5Ctext%7B%20-1,%20%7D%20otherwise%20%5Cend%7Bcases%7D)  

將其由上到下分成6個Block，並編號為L4~L0、最下面為otherwise，分開處理  
依照條件，判斷要進入哪個block(先到L2，x>2->L3，x<2->L1，以此類推)，然後做遞迴直到結束。  

用stack將每次運算的結果存起來  
一些用到的register:  
a0:要輸出的字串、輸入值x  
x5:目前儲存的值(計算用)  
x6~x8、x28~x30:存判斷大小用的數字  
t1:final value  

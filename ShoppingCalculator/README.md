Lab 1

Yichao Wang

Contacts: w.yichao@wustl.edu or https://github.com/StevenWongChess

Here is my idea for Creative portion, I designed two functionalities.

1. If the user typed some invalid value of either tax or discount or price, the text field will be flushed automatically and an alarm will pop up to remind the user. The user then need to click ```Retry ``` to continue.
2. Another one is a handy exchange rate calculator, by click the button once, you will get the amount of Japanese Yen equivalant to the final price. Clicking once more will show the amount in Chinese Yen. A global variable is used to simulate this effect.

For the extra credit work, first we use extension to add one extra function to the String class. Go to ```edit scheme```, then ```run```, then ```options``` to change the app language into Japanese. After that we need to create the corresponding ```.strings``` files (in my case it's named as ```Localizable.strings```). Lastly, whenever we use a string, we type ```.Localized()``` afterwards. Now we can see the changes. 

For example, after using ```"JPN".localized()``` in line 105, it becomes ```円``` which is in Japanese. To fulfill complete functionality, you probably need to download many dictionaries and import them to the ```.strings``` file. And set the app language go with the system language to test out different languages. One way might help with the creation of dictionaries is to use a script and take advantage of the google translation. But since this is out of the scope of this course, I am not able to achieve this sophisticated method.


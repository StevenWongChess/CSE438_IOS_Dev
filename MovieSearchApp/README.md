Lab 4

Yichao Wang

Contacts: w.yichao@wustl.edu or https://github.com/StevenWongChess

Here is my idea for Creative portion and Bonus.

For the creative part, I implement four features.

1. If you click the tableview cell in Favourite tab, you can jump into the detail of the movie you choose. Notice that the info of movie is stored locally but the image need to be pulled from the api. To save image locally, you can just add another element of type UIImage into the struct I defined in ```ParseStruct.swift``` and do some adjustment. To save space, I choose not to save the image locally.
2. I add a useful feature such that when you try to add a movie that is already in the favourite list, nothing happens. This feature is common when we use apps like Youtube to avoid repetition.
3. Auto load, which provides an initial UI that shows most popular movies the moment you launch the app.
4. Clear all, to make life easier, I create a clear button in the Favourite tab to delete all the favourite movies and we no longer need to delete them one by one. This feature can be further implemented to delete movie in the same category if I have time in winter break.



For extra bonus, I implement the 3D Touch function. To make life easier, the second creative part is implemented here as well. And I use the class ```utility``` and function ```_add``` to avoid code reuse.



I was shocked to find that I got 25 in Lab3, but after I download the Lab3 I uploaded, I realised that after I upload the draft instead of the final code. And I delete the final code instead of deleting the draft. Ending up I lost everything except a screenshot I take after I tested all the functions correctness and save it to the readme. Sad story. 
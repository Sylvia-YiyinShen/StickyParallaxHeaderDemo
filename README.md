# StickyParallaxHeaderDemo

## Feature
* Sticky header at the top
* Parallax header
* Auto resizing when dragging ended (toggle-able) 
* Customisable child component changes during scrolling

![Apr-17-2019 23-17-56](https://user-images.githubusercontent.com/46996132/56290746-2615cf00-6167-11e9-9ed8-72da814311f3.gif)


## How to use
1. Make you own header view subclass ParallaxHeaderBaseView
2. Initialize your own header view, then add the following code to viewDidAppear
<img width="758" alt="Screen Shot 2019-04-17 at 11 26 15 pm" src="https://user-images.githubusercontent.com/46996132/56291838-5eb6a800-6169-11e9-9438-086b7706ea83.png">
3. Override the following functions
<img width="760" alt="Screen Shot 2019-04-17 at 11 24 59 pm" src="https://user-images.githubusercontent.com/46996132/56291854-637b5c00-6169-11e9-937d-186074b7a223.png">



## Advanced usage
Override updateViews(scale: CGFloat) in your custom header view to animate child component during scrolling, e.g updating alpha, position, rotation, size....

<img width="519" alt="Screen Shot 2019-04-17 at 11 29 24 pm" src="https://user-images.githubusercontent.com/46996132/56291856-64ac8900-6169-11e9-8767-b9201f710ed7.png">

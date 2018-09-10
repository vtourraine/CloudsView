# ☁️ CloudsView

_`UIView` subclass displaying clouds floating by._

![`CloudsView` example](https://www.vtourraine.net/blog/img/2018/air-grenoble-2-clouds-view/four-clouds.png)

## How to use

First, you need to add an image called `Cloud` to your app’s asset catalog (i.e. the image is **not** included in this library).

Just add a `CloudsView` instance to your view hierarchy, like a regular `UIView`. Then call `startAnimation()` to start the animation loop.

## Future improvements

Feel free to send in a pull request to fix bugs and refine this library. For instance:

- [ ] Easy customization (cloud size, number of clouds, etc)
- [ ] Fix cloud disappearence when the view size changes during the animation
- [ ] Add parallax effect (clouds at the bottom moving faster then clouds at the top)
- [ ] Generate random cloud shapes

## Requirements

CloudsView is written in Swift 4.2, requires iOS 10.0 and Xcode 10.0.

## License

CloudsView is available under the MIT license. See the `LICENSE.txt` file for more info.

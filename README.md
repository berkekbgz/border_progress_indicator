## border_progress_indicator

##### Tiny package for indicating progress in a border.

![Image](https://raw.githubusercontent.com/berkekbgz/border_progress_indicator/main/resources/image.png)

### Usage

Wrap your widget in `BorderProgressIndicator`

```dart
BorderProgressIndicator(
	borderRadius: 10,
	value: 0.6,
	color: Colors.red,
	strokeWidth: 2,
	child: YOUR WIDGET HERE
),
```

#### Animated Version

You can also use self animated version with `AnimatedBorderProgressIndicator`.

```dart
AnimatedBorderProgressIndicator(
	borderRadius: 10,
	value: 0.6,
	color: Colors.red,
	curve: Curves.easeInCubic,
	strokeWidth: 2,
	child: YOUR WIDGET HERE
),
```


<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.3-orange.svg?style=flat" alt="Swift 5.3">
   </a>
    <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Xcode-12.0.1-blue.svg" alt="Swift 5.3">
   </a>
   <a href="https://twitter.com/ricardo_psantos/">
      <img src="https://img.shields.io/badge/Twitter-@ricardo_psantos-blue.svg?style=flat" alt="Twitter">
   </a>
</p>

## About

_"Our framework enables us to specify our screen layouts using a common declarative language that can be understood by everyone - in this case JSON. Based on that declaration, it converts that definition of components into native code, rendering our design system components"_ 

Inspired by these words I read at [Implementing native UI from scratch using JSON](https://www.farfetchtechblog.com/en/blog/post/implementing-native-ui-from-scratch-using-json/), I decided to give it a try and see how far could I go. 

## Current capabilities

✅ Adding sections, spaces, horizontal lines, labels, buttons, images and input fields on a inifinite vertical layout.

✅ Labels and buttons support properties and styles (predefined styles list).

✅ Buttons and TextFields react to user interactions.

✅ Added push new screens (and dismiss) support.

✅ Interact with elements using his id (defined on the JSON)

❌ Add relative/horizontal layout options (on roadmap)

## Version 1.5.0

* Added input fields support.

* Added capabilitie do interact with elements using his id (defined on the JSON)

## Version 1.4.0

* Added push and dismiss screen support.
* General bug fixs.
* Code re-engerier.

![image](Images/version1.4.0.png)

![image](Images/version1.4.0.gif)

## Sample Screen JSON

```
[
  {
    "type": "stackViewSection",
    "data": [ { "key": "text", "value": "My Profile" } ]
  },
  {
    "type": "imageView",
    "data": [
      { "key": "url", "value": "https:\\/\\/media-exp1.licdn.com\\/dms\\/image\\/C4E03AQHpQtIamtJZPA\\/profile-displayphoto-shrink_800_800\\/0\\/1601550428198?e=1616630400&v=beta&t=P8OwQSHL0V18A-NjlYwAMAKqlfXgLzNnIusoAyfTwP4" }
    ]
  },
  {
    "type": "stackViewSeparator",
    "data": [ { "key": "height", "value": "0" } ]
  },
  {
    "type": "label",
    "data": [
      { "key": "layoutStyle", "value": "title" },
      { "key": "text", "value": "Ricardo Santos" },
      { "key": "textAlignment", "value": "1" }
    ]
  },
  {
    "type": "label",
    "data": [
      { "key": "layoutStyle", "value": "value" },
      { "key": "text", "value": "Every line of code represents and ethical and moral decision" },
      { "key": "textAlignment", "value": "1" }
    ]
  },
  {
    "type": "stackViewSection",
    "data": [ { "key": "text", "value": "Contacts" } ]
  },
  {
    "type": "button",
    "data": [
      { "key": "layoutStyle", "value": "secondary" },
      { "key": "text", "value": "My LinkedIn" }
    ],
    "action": {
      "gesture": "touch_up_inside",
      "id": "action_open_url",
      "data": [ { "key": "params", "value": "https:\\/\\/www.linkedin.com\\/in\\/ricardopsantos\\/" } ],
      "type": "openURL"
    }
  },
  {
    "type": "button",
    "data": [
      { "key": "layoutStyle", "value": "secondary" },
      { "key": "text", "value": "Email me!" }
    ],
    "action": {
      "gesture": "touch_up_inside",
      "id": "action_open_url",
      "data": [ { "key": "params", "value": "mailto:abc@example.com?subject=Feedback" } ],
      "type": "openURL"
    }
  },
  {
    "type": "stackViewSection",
    "data": [ { "key": "text", "value": "" } ]
  },
  {
    "type": "button",
    "data": [
      { "key": "layoutStyle", "value": "primary" },
      { "key": "text", "value": "Tap to check all components!" }
    ],
    "action": {
      "gesture": "touch_up_inside",
      "id": "action_load_ScreenDesignables",
      "data": [ { "key": "params", "value": "ScreenDesignables" } ],
      "type": "pushScreen"
    }
  },
  {
    "type": "stackViewSeparator",
    "data": [ { "key": "height", "value": "0" } ]
  }
]
```
## UI fields JSON samples

__Sections__

```json
{ 
  "type": "stackViewSection",
  "data": [{"key": "text", "value": "Section title"}]
}
```

```json
{ 
  "type": "stackViewSection"
}
```

__Vertical Space__

```json
{
  "type": "stackViewSeparator",
  "data": [{"key": "height","value": "0"}]
}
```

__Labels__

```json
{
  "type": "label",
  "data": [
    {"key": "text", "value": "some text"},
    {"key": "layoutStyle", "value": "title" }
  ]
}
```

```json
{
  "id": "label_user_validation",
  "type": "label",
  "data": [
    {"key": "text", "some text"},
    {"key": "layoutStyle", "value": "value" }
    {"key": "textAlignment", "value": "1" }
  ]
}
```

__Input field__

```json
{
  "type": "textField",
  "data": [{"key": "text", "some text"}]
}
```

```json
{
  "id": "textField_password",
  "type": "textField",
  "data": [
    {"key": "text", ""},
    {"key": "textPlaceHolder", "value": "Insert your passord" },
    {"key": "textIsSecured", "value": "true" }
  ]
}
```

__UIImageView__

```json
{
  "type": "imageView",
  "data": [
    {"key": "url", "value": "https://cdn.vox-cdn.com/thumbor/zEZJzZFEXm23z-Iw9ESls2jYFYA=/89x0:1511x800/1600x900/cdn.vox-cdn.com/uploads/chorus_image/image/55717463/google_ai_photography_street_view_2.0.jpg"}]
}
```

__Button__

```json
{
  "type": "button",
  "data": [
    {"key": "layoutStyle", "value": "primary"},
    {"key": "text", "value": "Present next screen"}
  ],
  "action": {
    "gesture": "touch_up_inside",
    "type": "presentScreen",
    "data": [{"key": "params", "value": "ScreenC"}]}
  }
```

## Old versions

### Version 1.3.0

* Added ImageView support.

### Version 1.2.0

* Ability to have multiple screens and load then.

### Version 1.1.0

* UI elements with user interactions  (only for buttons)

### Version 1.0.0

* Adding UI elements on vertical layouts.
* UI elements with properties and styles.




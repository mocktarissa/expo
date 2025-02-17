---
title: Build configuration process
sidebar_title: Configuration process
---

import ImageSpotlight from '~/components/plugins/ImageSpotlight'

In this guide, you will learn what happens when EAS CLI configures your project with `eas build:configure` (or `eas build` - which runs this same process if the project is not yet configured).

EAS CLI performs the following steps when configuring your project:

#### 1. Ask you about the platform(s) to configure

If you only want to use EAS Build for a single platform, that's fine. If you change your mind, you can come back and configure the other later.

<ImageSpotlight alt="Terminal running eas build command with platform iOS and Android options available" src="/static/images/eas-build/configure/01-configure-platform.png" containerStyle={{ paddingBottom: 0 }} />

#### 2. Create eas.json

The command will create an **eas.json** file in the root directory with the default configuration. It looks something like this:

```json
{
  "build": {
    "development": {
      "developmentClient": true,
      "distribution": "internal"
    },
    "preview": {
      "distribution": "internal"
    },
    "production": {}
  }
}
```

If you have a bare project, it will look a bit different.

This is your EAS Build configuration. It defines three build profiles named `development`, `preview`, and `production` (you can have multiple build profiles like `production`, `debug`, `testing`, etc.) for each platform. If you want to learn more about **eas.json** see the [Configuration with eas.json](/build/eas-json.md) page.

#### 3. Configure the project

This step varies depending on the project type you have.

#### 3.1. Bare project

If you choose to configure the Android project, EAS CLI will update your Gradle project so we can build it on our servers.
This step patches **build.gradle** and includes our custom signing configuration. The configuration itself is saved to a separate file: **eas-build.gradle**.

If you also choose to configure the iOS project, there are no additional steps.

#### 3.2. Managed project

If you haven't configured your **app.json** with `android.package` and/or `ios.bundleIdentifier` yet, EAS CLI will prompt you to specify them.

- `android.package` will be used as the Android application id which is used to identify your app on the Google Play Store
- `ios.bundleIdentifier` will be used to identify you app on the Apple App Store

<ImageSpotlight alt="Application identifier prompts in eas build:configure" src="/static/images/eas-build/configure/02-configure-app-ids.png" containerStyle={{ paddingBottom: 0 }} />

In the example above, we defined exactly the same Android application id and iOS bundle identifier. However, they don't need to match.

#### 5. Next steps

That's all there is to configuring a project to be compatible with EAS Build.
There is one final step if you set `cli.requireCommit` to `true` in your **eas.json** — you'll be prompted to commit all the changes we made for you. You can choose to review them before committing, and you can either specify the git commit message or use a default message.

<ImageSpotlight alt="Application identifier prompts in eas build:configure" src="/static/images/eas-build/configure/03-next-steps.png" containerStyle={{ paddingBottom: 0 }} />

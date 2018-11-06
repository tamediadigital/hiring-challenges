Why Progressive Web Apps matters?

# What is a Progressive Web App?
> [Progressive Web Apps](https://developers.google.com/web/progressive-web-apps) are experiences that combine the best of the web and the best of apps. They are useful to users from the very first visit in a browser tab, no install required. As the user progressively builds a relationship with the App over time, it becomes more and more powerful. It loads quickly, even on flaky networks, sends relevant push notifications, has an icon on the home screen and loads as a top-level, full screen experience.

Google came up with the term Progressive Web App in 2015 to describe modern web applications which meet the following criteria:


- **Progressive** - Work for every user, regardless of browser choice because they’re built with progressive enhancement as a core tenet.
- **Responsive** - Fit any form factor: desktop, mobile, tablet, or whatever is next.
- **Connectivity independent** - Enhanced with service workers to work offline or on low quality networks.
- **App-like** - Feel like an app to the user with app-style interactions and navigation because they’re built on the app shell model.
- **Fresh** - Always up-to-date thanks to the service worker update process.
- **Safe** - Served via HTTPS to prevent snooping and ensure content hasn’t been tampered with.
- **Discoverable** - Are identifiable as “applications” thanks to W3C manifests and service worker registration scope allowing search engines to find them.
- **Re-engageable** - Make re-engagement easy through features like push notifications.
- **Installable** - Allow users to “keep” apps they find most useful on their home screen without the hassle of an app store.
- **Linkable** - Easily share via URL and not require complex installation.

Such an application is powered by modern Web technologies to load very fast on slow network connections ([Service Worker)](http://www.html5rocks.com/en/tutorials/service-worker/introduction/), send [Push Notifications](https://developers.google.com/web/fundamentals/engage-and-retain/push-notifications/) and [can be installed](https://developers.google.com/web/updates/2015/03/increasing-engagement-with-app-install-banners-in-chrome-for-android) on the mobile device to act like a native App.

![screenshots](https://d2mxuefqeaa7sj.cloudfront.net/s_B45631070937FB75D428ADAD43FD5B935F55B483DFB9DF98B069757B9AAF5A17_1463303084616_pwa-overview-example.jpg)


The example above shows the 20min Digital News App that [Fabian Mettler](https://github.com/maveonair) built for his application at Tamedia. It is a Progressive Web App that is be used in this paper to explain the principles of a Progressive Web App.

It is important to say that Progressive Web Apps aren’t only unique to Google Chrome and Android.[ Other browser vendors](https://jakearchibald.github.io/isserviceworkerready/) such as Firefox and Microsoft are working on the implementation of the APIs that are powering Progressive Web Apps. 

# Principles
## Web App Manifest
> The Web App manifest is a simple JSON file that gives you, the developer, the ability to control how your app appears to the user in the areas that they would expect to see apps (for example the mobile home screen), direct what the user can launch and more importantly how they can launch it.

The Web App manifest enables a web application to have a rich presence on the users home screen and can therefore be launched in full-screen mode with not URL bar on Android. Furthermore, when a user starts the app from the home screen then a “[splash screen](https://developers.google.com/web/updates/2015/10/splashscreen?hl=en)” is shown with the [theme color ](https://developers.google.com/web/updates/2014/11/Support-for-theme-color-in-Chrome-39-for-Android?hl=en)and the app icon. 

![homescreen](https://d2mxuefqeaa7sj.cloudfront.net/s_B45631070937FB75D428ADAD43FD5B935F55B483DFB9DF98B069757B9AAF5A17_1463302534619_pwa-web-app-manifest.jpg)


The following Web App manifest is from the 20min Digital News App:


    {
      "name": "20min Digital News",
      "short_name": "Digital News",
      "icons": [{
        "src": "images/icons/icon-128x128.png",
          "sizes": "128x128",
          "type": "image/png"
        }, {
          "src": "images/icons/icon-144x144.png",
          "sizes": "144x144",
          "type": "image/png"
        }, {
          "src": "images/icons/icon-152x152.pång",
          "sizes": "152x152",
          "type": "image/png"
        }, {
          "src": "images/touch/icon-192x192.png",
          "sizes": "192x192",
          "type": "image/png"
        }, {
          "src": "images/touch/icon-256x256.png",
          "sizes": "256x256",
          "type": "image/png"
        }],
      "start_url": "/index.html",
      "display": "standalone",
      "background_color": "#3E4EB8",
      "theme_color": "#2F3BA2"
    }

As can be derived from this Web App manifest, it defines the name, the background and theme color, the images, the start url and the display mode of the Web App. The start url can be used for instance to track if the App was opened via a browser or as installed App by using a different start url.

## Add to home screen

Chrome on Android or Safari on iOS has support for adding a site to the home screen for a while now. But recents versions of Chrome on Android also support suggesting sites be added using native [Web App install banners](https://developers.google.com/web/updates/2015/03/increasing-engagement-with-app-install-banners-in-chrome-for-android).

![](https://d2mxuefqeaa7sj.cloudfront.net/s_B45631070937FB75D428ADAD43FD5B935F55B483DFB9DF98B069757B9AAF5A17_1463303124012_pwa-home-screen.jpg)


In order to display the Web App install banner the application must meet the following criteria:

- Have a valid Web App manifest
- Be served over HTTPS
- Have a valid Service Worker registered
- Be visited twice, at least 5 minutes between the visits
## Service Worker for caching

A [Service Worker](https://www.w3.org/TR/service-workers) is a script with a short lifetime that runs in the background, separate from the web application. It wakes up when it gets an event and runs only als long as it needs to process it. This allows a web application for example to use the Cache API to cache resources and thus to provide users with an offline experience. But a Service Worker can not only be used for offline caching, instead it can also offer a significant performance wins in the form of instant loading for repeat visits to the web application. Thus, the  shell of web application can be cached so it works offline and the content is populated by using JavaScript.


![funky](https://d2mxuefqeaa7sj.cloudfront.net/s_B45631070937FB75D428ADAD43FD5B935F55B483DFB9DF98B069757B9AAF5A17_1463304832315_pwa-startup-offline.gif)
![funky2](https://d2mxuefqeaa7sj.cloudfront.net/s_B45631070937FB75D428ADAD43FD5B935F55B483DFB9DF98B069757B9AAF5A17_1463304870228_pwa-refresh-offline.gif)



### **Install a Service Worker**

When a web application is loaded in the browser then the Service Worker is installed via the following code:


      if('serviceWorker' in navigator) {
        navigator.serviceWorker
                 .register('/service-worker.js')
                 .then(function() { console.log('Service Worker Registered'); });
      }

First of all, the script should check if the Server Worker API is available before it tries to register the Service Worker. When the API is available then the Service Worker can be registered by providing the location of the Service Worker implementation. Important to say is that the Service Worker script needs to be in the root path of the web application.


### **Events**

As mentioned before, a Service Worker can listen to several events to do stuff. For instance, the *install event* can be used to get stuff ready before other events are handled, e.g. caching the app shell:


    var cacheName = '20min-digital-v10';
    var filesToCache = [
      '/',
      '/index.html',
      '/manifest.json',
      '/scripts/app.js',
      '/scripts/material.min.js',
      '/styles/main.css',
      '/styles/material.min.css',
      '/images/refresh.svg',
      '/images/icons/icon-128x128.png',
      '/images/icons/icon-144x144.png',
      '/images/icons/icon-152x152.png',
      '/images/icons/icon-192x192.png',
      '/images/icons/icon-256x256.png'
    ];
    
    self.addEventListener('install', function(e) {
      console.log('[ServiceWorker] Install');
      e.waitUntil(
        caches.open(cacheName).then(function(cache) {
          console.log('[ServiceWorker] Caching App Shell');
          return cache.addAll(filesToCache);
        })
      );
    });

In the example of the 20min Digital News app, when a Service Worker gets the *install event* then it installs the app shell. The app shell consist of the HTML, CSS, JavaScripts and images that are needed to show the layout properly and the code to fetch the content.

Once a new Service Worker has installed and is used, the new Service Worker gets activated. In this scenario the Service Worker gets the *activate event *which can be used for instance to delete unused caches:


    self.addEventListener('activate', function(e) {
      console.log('[ServiceWorker] Activate');
      e.waitUntil(
        caches.keys().then(function(keyList) {
          return Promise.all(keyList.map(function(key) {
            console.log('[ServiceWorker] Removing old cache', key);
            if (key !== cacheName) {
              return caches.delete(key);
            }
          }));
        })
      );
    });

In the case of a network request, a Service Worker can listen to the *fetch event* and serve the request from the cache. If the requested resource does not match in the cache then it can get it from the network and add it to the cache:


    self.addEventListener('fetch', function(e) {
      console.log('[ServiceWorker] Fetch', e.request.url);
      
      // We only cache the news data, other request should be handled directly.
      var dataUrl = 'https://20min-digital.firebaseio.com/digital.json';
      if (e.request.url.indexOf(dataUrl) === 0) {
        e.respondWith(
          fetch(e.request).then(function(response) {
              return caches.open(dataCacheName).then(function(cache) {
                cache.put(e.request.url, response.clone());
                console.log('[ServiceWorker] Fetched & cached data');
                return response;
              });
            })
        );
      } else {
        e.respondWith(
          caches.match(e.request).then(function(response) {
            return response || fetch(e.request);
          })
        );
      }
    });
## Push Notifications

[Push Notifications](https://developers.google.com/web/fundamentals/getting-started/push-notifications) can be an important enabler for a web application to engage with its users outside of a tab. The browser can be closed and the web application must not be opened to receive push notifications. In order to use this feature, a Service Work and a Web App manifest is required.

![](https://d2mxuefqeaa7sj.cloudfront.net/s_B45631070937FB75D428ADAD43FD5B935F55B483DFB9DF98B069757B9AAF5A17_1463309506527_pwa-push-notification.jpg)


Unfortunately, the Push API is only [implemented](https://www.chromestatus.com/features/5416033485586432) in Google Chrome, currently in development in Firefox and under consideration in other browsers.

### 


# Conclusion

Creating a Progressive Web App can be an enabler for companies to increase the engagement with their users by using Web App install banners, home screen + full-screen experience, offline caching and Push Notifications. Furthermore, it allows companies to create new proof-of-concepts just with Web technologies to deliver a great user experience on all platforms without having huge investment costs and struggling with the implementation of
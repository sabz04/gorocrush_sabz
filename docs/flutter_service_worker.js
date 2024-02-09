'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d87c364c2f132cbe2343f9a7fafa39fa",
"assets/AssetManifest.bin.json": "2334afe8fd798ef3b6b04113db70cdba",
"assets/AssetManifest.json": "b80b49c3c7d97fefb78396028518c7ef",
"assets/assets/cute_cat_roses.jpg": "839c77cff05411dc8d32713c80b0d305",
"assets/assets/gif/cute_cat_0.gif": "b6c79ea48ee5566d48f8225d838eb999",
"assets/assets/gif/cute_cat_1.gif": "d2300382fd5f870965a753d01e37f577",
"assets/assets/gif/cute_cat_3.gif": "465f85a75046bc46cb9c879381173714",
"assets/assets/gif/cute_cat_angry_2.gif": "c76669a76f61e04dcbcf2a5363b54aa0",
"assets/assets/gif/cute_cat_angry_3.gif": "d310e0feb5fb4cdc37aa28800b727054",
"assets/assets/gif/cute_cat_cool.gif": "263883639ccdd92fd492d5b2cc422028",
"assets/assets/gif/cute_cat_dance.gif": "a0f6a8d947eeabf6bbcde6f5b9123323",
"assets/assets/gif/cute_cat_sad.gif": "e731c9024d470f12fabade47393989f8",
"assets/assets/gifs_array/cat_0.gif": "1e44fc7afb507ffe03650b3d473952f0",
"assets/assets/gifs_array/cat_1.gif": "eb8dc1b0d517739a7adba71983796aa7",
"assets/assets/gifs_array/cat_10.gif": "38188730d0e812405d8be994a67a74e4",
"assets/assets/gifs_array/cat_11.gif": "d350cc41c193f7cabee08899c1c33b5c",
"assets/assets/gifs_array/cat_12.gif": "88e916b2937ae0c742aaaa20075bddd1",
"assets/assets/gifs_array/cat_13.gif": "df05e998cbcc3975348980286aa38c13",
"assets/assets/gifs_array/cat_14.gif": "094f6f9f63abee0962e073cb8943c912",
"assets/assets/gifs_array/cat_2.gif": "d757083a870f34cfe48b6afdb4b2f0a4",
"assets/assets/gifs_array/cat_3.gif": "223355a43df0cb353d59a219fb3e1a6b",
"assets/assets/gifs_array/cat_4.gif": "0b822f72517c6ae56db246640f82fe21",
"assets/assets/gifs_array/cat_5.gif": "25561c00c71fe29a8f32cefbdbe94e9b",
"assets/assets/gifs_array/cat_6.gif": "b09899320e8928a6031d7a23e3bebbfa",
"assets/assets/gifs_array/cat_7.gif": "6db41c67d4c714cc0cec2f6a15602e5a",
"assets/assets/gifs_array/cat_8.gif": "619ddc2907ce9d3b3a7f01a587420553",
"assets/assets/gifs_array/cat_9.gif": "8f5ba7e092483d5b09249b9b3784a987",
"assets/assets/sounds/sound.m4a": "225e9bfa79f61d13ef8d95006c719618",
"assets/assets/sounds/sound.mp3": "3452b56d201c00e8efab3eff320dee3e",
"assets/assets/sounds/sound.mp4": "37ca89b16c9b7a01e976bd55d7214f19",
"assets/FontManifest.json": "859ccb2dd3beb62cd94ef8a23e706641",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/fonts/ubuntu_bold.ttf": "896a60219f6157eab096825a0c9348a8",
"assets/fonts/ubuntu_italic.ttf": "9f353a170ad1caeba1782d03dd8656b5",
"assets/fonts/ubuntu_light.ttf": "c9d68f61bf89fde6a24da697bc45d6f9",
"assets/fonts/ubuntu_medium.ttf": "d3c3b35e6d478ed149f02fad880dd359",
"assets/fonts/ubuntu_regular.ttf": "84ea7c5c9d2fa40c070ccb901046117d",
"assets/NOTICES": "7a9191c3085f064c4a9d21fbec1d25e5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.ico": "678b53f76524359621aa5de5eb780687",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "bd75f2ff4423fa7f6bc5e18a20e2f079",
"/": "bd75f2ff4423fa7f6bc5e18a20e2f079",
"main.dart.js": "45a228651c9b66211b8d6e7ab80aee3c",
"manifest.json": "c9c6e178b1a37f4ddb356807fa7235ed",
"version.json": "a3322b2f035e5345663b567001345585"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "257aed03e5540e455cfcac47b860709e",
"version.json": "0b35c3888b246daa0fc2baf5dcbfce34",
"index.html": "225b3669d09596359b6ae212d73259aa",
"/": "225b3669d09596359b6ae212d73259aa",
"main.dart.js": "64861c72a96b19d72fc2ee864a66463a",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e0e1f54c08b4fab4b4cd9c6444906ea9",
"assets/AssetManifest.json": "e44f5a42cef6ac699934477a08dc4251",
"assets/NOTICES": "87cf6ac3e1acd1e97001f29566f0ec07",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "5561f6a908270b650532e01b2e25f152",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "bdb355b96bf20b8aef9ef70997cf35a1",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "eec8fa3f8446fb49842a10f13c5f4195",
"assets/packages/getwidget/icons/slack.png": "19155b848beeb39c1ffcf743608e2fde",
"assets/packages/getwidget/icons/twitter.png": "caee56343a870ebd76a090642d838139",
"assets/packages/getwidget/icons/linkedin.png": "822742104a63a720313f6a14d3134f61",
"assets/packages/getwidget/icons/dribble.png": "1e36936e4411f32b0e28fd8335495647",
"assets/packages/getwidget/icons/youtube.png": "1bfda73ab724ad40eb8601f1e7dbc1b9",
"assets/packages/getwidget/icons/line.png": "da8d1b531d8189396d68dfcd8cb37a79",
"assets/packages/getwidget/icons/pinterest.png": "d52ccb1e2a8277e4c37b27b234c9f931",
"assets/packages/getwidget/icons/whatsapp.png": "30632e569686a4b84cc68169fb9ce2e1",
"assets/packages/getwidget/icons/google.png": "596c5544c21e9d6cb02b0768f60f589a",
"assets/packages/getwidget/icons/wechat.png": "ba10e8b2421bde565e50dfabc202feb7",
"assets/packages/getwidget/icons/facebook.png": "293dc099a89c74ae34a028b1ecd2c1f0",
"assets/packages/shoesly_resources/assets/images/xlingbold.svg": "68f0e97795b05a6b40aa912f67b1c5db",
"assets/packages/shoesly_resources/assets/images/jordonshafe.svg": "691a107eaca64059c819f9ba992ceeab",
"assets/packages/shoesly_resources/assets/images/addidasshade.svg": "689b38be48c3c6a187e4f1da587faef4",
"assets/packages/shoesly_resources/assets/images/vanshade.svg": "5c6e638807a0a038a5f668814cc8ddfb",
"assets/packages/shoesly_resources/assets/images/book.svg": "9fe07f472aeb700746e0c2f23f27f3bf",
"assets/packages/shoesly_resources/assets/images/pumashade.svg": "0149d6dd274415b461dda51c499b98a0",
"assets/packages/shoesly_resources/assets/images/nikeshade.svg": "b72f9af9284af5be66c97fa95b549d26",
"assets/packages/shoesly_resources/assets/images/onboard1.svg": "890695b65a917b0bc2789483e5f9f64a",
"assets/packages/shoesly_resources/assets/images/onboard2.svg": "37cb1eb0998b1d0ce41fcce73da27088",
"assets/packages/shoesly_resources/assets/images/onboard3.svg": "6c5134404998e08559dd27787d4c157b",
"assets/packages/shoesly_resources/assets/images/addidasbold.svg": "4fe168440eb18880240ef1a80de424a5",
"assets/packages/shoesly_resources/assets/images/shoe2.svg": "f783b3b7b9e42d1ff63aa2d6356ebd62",
"assets/packages/shoesly_resources/assets/images/pumabold.svg": "c6f88b61b1e3c58671eb96bb91b5db36",
"assets/packages/shoesly_resources/assets/images/xlingshade.svg": "460771ecf49463629699e86168c77791",
"assets/packages/shoesly_resources/assets/images/shoe1.svg": "4d41de9aeec85aa4753d9d74d3625e6a",
"assets/packages/shoesly_resources/assets/images/nikebold.svg": "a2a43d38656d6b25c1caf3b4c441e63b",
"assets/packages/shoesly_resources/assets/images-bin/onboard1.svg.vec": "fc67071ce6323bb367304b0d581d421e",
"assets/packages/shoesly_resources/assets/images-bin/addidasshade.svg.vec": "debd018dd3402c3f1f2c5b4cb632dffb",
"assets/packages/shoesly_resources/assets/images-bin/xlingshade.svg.vec": "14531f9b0e023a31f7aefc49fe32ee7f",
"assets/packages/shoesly_resources/assets/images-bin/vanshade.svg.vec": "ee5056b6ec113ccd6dcb703ec8ee64d2",
"assets/packages/shoesly_resources/assets/images-bin/onboard2.svg.vec": "54471f4d3d42d6e9d3da24b750768305",
"assets/packages/shoesly_resources/assets/images-bin/onboard3.svg.vec": "aa251ad0518da4bf26915323795c36f4",
"assets/packages/shoesly_resources/assets/images-bin/addidasbold.svg.vec": "9d24b41873e2477470cfd9c810cfb354",
"assets/packages/shoesly_resources/assets/images-bin/book.svg.vec": "e9b8450ac896475d40abef69c54fe1a2",
"assets/packages/shoesly_resources/assets/images-bin/xlingbold.svg.vec": "9064000e84a288fb8df5ba8c36b0d5be",
"assets/packages/shoesly_resources/assets/images-bin/shoe1.svg.vec": "d2892b6ab696a1d972715034985e5564",
"assets/packages/shoesly_resources/assets/images-bin/jordonshafe.svg.vec": "a456c4d6e66f97e14afbf9b60f248c75",
"assets/packages/shoesly_resources/assets/images-bin/nikebold.svg.vec": "14b96bb42d97f7ac7befcd872e563bb0",
"assets/packages/shoesly_resources/assets/images-bin/pumashade.svg.vec": "e42d0ae6af0edbc0a08d322da1a21975",
"assets/packages/shoesly_resources/assets/images-bin/nikeshade.svg.vec": "4170981c01414d59e48a201e27f2c469",
"assets/packages/shoesly_resources/assets/images-bin/shoe2.svg.vec": "d2892b6ab696a1d972715034985e5564",
"assets/packages/shoesly_resources/assets/images-bin/pumabold.svg.vec": "0b0f5edcd545ce03254c140d6a09819a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "6f19a6eb2ba1adcaf14f601a2d6a96dc",
"assets/fonts/MaterialIcons-Regular.otf": "9d7443b31559ae388f3a9e28d58eebd5",
"assets/assets/animation.json": "cdd3103638c18be73270fabf0eed8e27",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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

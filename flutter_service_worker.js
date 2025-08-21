'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "aad817c455fce790bdef7755da0f50a4",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"version.json": "1c84b8c114769d87c4d85ac51475e33a",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"main.dart.js": "fbb31e58a710ed5b4a4754c18fcf00d8",
"index.html": "ff347c6a73dec3ca16ad467c4ba4e79e",
"/": "ff347c6a73dec3ca16ad467c4ba4e79e",
"assets/packages/flowin_design/assets/fonts/Supreme-Extralight.ttf": "a550f70894cc5d109ce5aaceb3069b8b",
"assets/packages/flowin_design/assets/fonts/Supreme-Extrabold.ttf": "10dd58277e8c883c0a4f26c9e723e2c6",
"assets/packages/flowin_design/assets/fonts/Supreme-Italic.ttf": "f2d5c45941c9a3f77ef54ad75a5e593d",
"assets/packages/flowin_design/assets/fonts/Supreme-MediumItalic.ttf": "64c4d9a09d5fe222fefacef6db91e637",
"assets/packages/flowin_design/assets/fonts/Supreme-ExtraboldItalic.ttf": "eff16dd9bc3b3983f1c436d6cccbddce",
"assets/packages/flowin_design/assets/fonts/Supreme-Medium.ttf": "3514a54cfb96c19a8f0675b27dde3eff",
"assets/packages/flowin_design/assets/fonts/Supreme-Light.ttf": "ed110f731f12327168f99f4124ecc184",
"assets/packages/flowin_design/assets/fonts/Supreme-ThinItalic.ttf": "95848e04929b9c997f7bb6eaa46c65d1",
"assets/packages/flowin_design/assets/fonts/Supreme-Regular.ttf": "e89fe12a5d04c78aa3dc36f0bc7f3266",
"assets/packages/flowin_design/assets/fonts/Supreme-Thin.ttf": "cbd2bacc206251dc55f1b9762befa3f7",
"assets/packages/flowin_design/assets/fonts/Supreme-LightItalic.ttf": "8c210aa1f82700abe395bbb4cd36eb39",
"assets/packages/flowin_design/assets/fonts/Supreme-Bold.ttf": "b8419a9c56ac7bf0af4e96a883e861ab",
"assets/packages/flowin_design/assets/fonts/Supreme-ExtralightItalic.ttf": "7bffc91e7e5d9ed9ea919830fff73c0e",
"assets/packages/flowin_design/assets/fonts/Supreme-BoldItalic.ttf": "97a5ef7acae0b63a3fe16b3bd3f667c9",
"assets/packages/lucide_icons_flutter/assets/lucide.ttf": "af594b723d134d2d1199ea7497b0625a",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w100.ttf": "13fd755e07c8d70cd49387ad9a2cb853",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w500.ttf": "92f641c287e193b6799fbd5ff6176290",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w300.ttf": "8ca937f07423865d6d8c0215f9dcfeeb",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w200.ttf": "53e58f44522cbeb659ddaa1d5b63bc8f",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w400.ttf": "3115098703d046eea3472b37da643037",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w600.ttf": "7de32348d080f0732d29674fb7d364b1",
"assets/FontManifest.json": "963788ce19caf99b05f006d1c48cf1d8",
"assets/NOTICES": "7da9b769e9a8aac8f04d88103129f258",
"assets/AssetManifest.json": "17e7718568836dd245027156873075a3",
"assets/AssetManifest.bin": "641dfb62b77063b1b0991a8dbbf7553a",
"assets/AssetManifest.bin.json": "81651f194f93f546b9aba56e7673a59d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080"};
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

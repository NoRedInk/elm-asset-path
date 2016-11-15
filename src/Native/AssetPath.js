var _NoRedInk$elm_asset_path$Native_AssetPath = function() {
  if (typeof window === "undefined"){
    return {
      rootUrl : { ctor : 'Nothing' }
    };
  }

  var rootUrlNode = document.head.querySelector('meta[name="assets-root-url"]');
  var rootUrl =
      (rootUrlNode === null || (typeof rootUrlNode.content !== "string") || rootUrlNode.content.length == 0)
          ? { ctor: 'Nothing' }
          // ensure rootUrl can be simply concatenated with an asbolute path
          : { ctor: 'Just', _0: rootUrlNode.content.replace(/\/$/, '') };

  return {
    rootUrl: rootUrl
  };

}();
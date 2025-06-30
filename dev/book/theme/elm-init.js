(function () {
  var search = document.createElement("div");
  var results = document.createElement("results");
  document
    .getElementsByTagName("mdbook-sidebar-scrollbox")[0]
    .appendChild(search);
  var main = document.getElementsByTagName("main")[0];
  main.insertBefore(results, main.children[0]);

  var dendrix_data = {
    repositories: [
      {
        name: "vic-vix",
        trees: [
          {
            name: "default",
            aspects: [
              { aspect: "game", class: "darwin", files: ["file1", "file2"] },
              { aspect: "game", class: "nixos", files: ["file3"] },
              { aspect: "dev", class: "nixos", files: ["file3nixos"] },
              { aspect: "dev", class: "darwin", files: ["file3darwin"] },
            ],
          },
          {
            name: "vic",
            aspects: [
              { aspect: "vic", class: "nixos", files: ["file3nixos"] },
              { aspect: "vic", class: "darwin", files: ["file3darwin"] },
            ],
          },
        ],
      },
      {
        name: "drupol-infra",
        trees: [
          {
            name: "default",
            aspects: [
              { aspect: "dev", class: "nixos", files: ["a.nix"] },
              { aspect: "ai", class: "nixos", files: ["b.nix"] },
            ],
          },
        ],
      },
    ],
  };

  var elm_search = Elm.Search.init({
    node: search,
    flags: window.dendrix_repos,
  });

  var elm_results = Elm.Results.init({
    node: results,
    flags: {},
  });

  elm_search.ports.cmdOut.subscribe(function (cmd) {
    elm_results.ports.cmdIn.send(cmd);
  });

  elm_results.ports.cmdOut.subscribe(function (cmd) {
    if (cmd.name === "HIGHLIGHT") {
      setTimeout(() => {
        hljs.highlightAll();
      }, 0);
    } else {
      elm_search.ports.cmdIn.send(cmd);
    }
  });
})();

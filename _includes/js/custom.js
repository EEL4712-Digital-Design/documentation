document.addEventListener("DOMContentLoaded", function () {
  var contentWrap = document.querySelector(".main-content-wrap");
  var mainContent = document.querySelector("#main-content main");

  if (!contentWrap || !mainContent) {
    return;
  }

  var headings = Array.prototype.filter.call(
    mainContent.querySelectorAll("h2[id], h3[id]"),
    function (heading) {
      return !heading.classList.contains("no_toc") && heading.textContent.trim();
    }
  );

  if (!headings.length) {
    return;
  }

  var outline = document.createElement("aside");
  outline.className = "page-outline";
  outline.setAttribute("aria-label", "On this page");

  var title = document.createElement("p");
  title.className = "page-outline-title";
  title.textContent = "On this page";
  outline.appendChild(title);

  var list = document.createElement("ul");
  list.className = "page-outline-list";

  var links = headings.map(function (heading) {
    var item = document.createElement("li");
    item.className =
      "page-outline-item page-outline-item-level-" + heading.tagName.slice(1);

    var link = document.createElement("a");
    link.className = "page-outline-link";
    link.href = "#" + heading.id;
    link.textContent = heading.textContent.trim();

    item.appendChild(link);
    list.appendChild(item);
    return link;
  });

  outline.appendChild(list);
  contentWrap.appendChild(outline);
  contentWrap.classList.add("has-page-outline");

  var updateActiveLink = function () {
    var activeIndex = 0;

    headings.forEach(function (heading, index) {
      if (heading.getBoundingClientRect().top <= 96) {
        activeIndex = index;
      }
    });

    links.forEach(function (link, index) {
      var isActive = index === activeIndex;
      link.classList.toggle("is-active", isActive);

      if (isActive) {
        link.setAttribute("aria-current", "location");
      } else {
        link.removeAttribute("aria-current");
      }
    });
  };

  updateActiveLink();
  window.addEventListener("scroll", updateActiveLink, { passive: true });
  window.addEventListener("hashchange", updateActiveLink);
});

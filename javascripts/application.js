(function() {
  var onScroll, toggleSidebar;

  onScroll = function(event) {
    var scrollPos;
    scrollPos = $(document).scrollTop();
    return $('#sidebarMenu .scrollTo').each(function() {
      var currLink, refElement;
      currLink = $(this);
      refElement = $(currLink.attr('href'));
      if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
        $('#sidebarMenu .scrollTo').removeClass('active');
        return currLink.addClass('active');
      } else {
        return currLink.removeClass('active');
      }
    });
  };

  toggleSidebar = function() {
    if ($('body').width() >= 1241) {
      return $('#sidebarMenu').fadeIn();
    } else {
      return $('#sidebarMenu').fadeOut();
    }
  };

  $(function() {
    $(document).on("scroll", onScroll);
    $(window).on("resize", toggleSidebar);
    $("#menuButton").click(function() {
      return $("#sidebarMenu").fadeIn();
    });
    $("#closeMenuButton").click(function() {
      return $("#sidebarMenu").fadeOut();
    });
    return $('.scrollTo').each(function() {
      return $(this).on('click', function(e) {
        var scrollTo;
        e.preventDefault();
        scrollTo = $(this).attr('href');
        return $('html,body').animate({
          scrollTop: $(scrollTo).offset().top
        }, 1000);
      });
    });
  });

}).call(this);

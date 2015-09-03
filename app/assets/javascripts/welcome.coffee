# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

onScroll = (event) ->
  scrollPos = $(document).scrollTop()

  $('#sidebarMenu .scrollTo').each ->
    currLink = $(this)
    refElement = $(currLink.attr('href'))
    if refElement.position().top <= scrollPos and refElement.position().top + refElement.height() > scrollPos
      $('#sidebarMenu .scrollTo').removeClass 'active'
      currLink.addClass 'active'
    # else if refElement.position().top <= $('body').position().top
      # $('#sidebar .scrollTo')[0].addClass('active')
    else
      currLink.removeClass 'active'

toggleSidebar = () ->
  if $('body').width() >= 1241
    $('#sidebarMenu').fadeIn()
  else
    $('#sidebarMenu').fadeOut()

$ ->
  $(document).on("scroll", onScroll)

  $(window).on("resize", toggleSidebar)

  $("#menuButton").click ->
    $("#sidebarMenu").fadeIn()

  $("#closeMenuButton").click ->
    $("#sidebarMenu").fadeOut()

  $('.scrollTo').each ->
    $(this).on 'click', (e) ->
      e.preventDefault()

      scrollTo = $(this).attr('href')

      $('html,body').animate
        scrollTop: $(scrollTo).offset().top
      , 1000

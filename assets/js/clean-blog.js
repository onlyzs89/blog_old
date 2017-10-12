(function($) {
  "use strict"; // Start of use strict

  // Floating label headings for the contact form
  $("body").on("input propertychange", ".floating-label-form-group", function(e) {
    $(this).toggleClass("floating-label-form-group-with-value", !!$(e.target).val());
  }).on("focus", ".floating-label-form-group", function() {
    $(this).addClass("floating-label-form-group-with-focus");
  }).on("blur", ".floating-label-form-group", function() {
    $(this).removeClass("floating-label-form-group-with-focus");
  });

  // Show the navbar when the page is scrolled up
  var MQL = 1170;

  //primary navigation slide-in effect
  if ($(window).width() > MQL) {
    var headerHeight = $('#mainNav').height();
    $(window).on('scroll', {
        previousTop: 0
      },
      function() {
        var currentTop = $(window).scrollTop();
        //check if user is scrolling up
        if (currentTop < this.previousTop) {
          //if scrolling up...
          if (currentTop > 0 && $('#mainNav').hasClass('is-fixed')) {
            $('#mainNav').addClass('is-visible');
          } else {
            $('#mainNav').removeClass('is-visible is-fixed');
          }
        } else if (currentTop > this.previousTop) {
          //if scrolling down...
          $('#mainNav').removeClass('is-visible');
          if (currentTop > headerHeight && !$('#mainNav').hasClass('is-fixed')) $('#mainNav').addClass('is-fixed');
        }
        this.previousTop = currentTop;
      });
  }

})(jQuery); // End of use strict



// Add by onlyzs

// chart
var sumChart = document.getElementById('sumChart')
if(sumChart){
  var ctx = sumChart.getContext('2d');
  var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'polarArea',

      // The data for our dataset
      data: {
          labels: ["速度", "難易度", "疲労度", "混雑度", "満足度", "展望度"],
          datasets: [{
              backgroundColor: [
                  Chart.helpers.color("red").alpha(0.5).rgbString(),
                  Chart.helpers.color("blue").alpha(0.5).rgbString(),
                  Chart.helpers.color("orange").alpha(0.5).rgbString(),
                  Chart.helpers.color("green").alpha(0.5).rgbString(),
                  Chart.helpers.color("purple").alpha(0.5).rgbString(),
                  Chart.helpers.color("yellow").alpha(0.5).rgbString(),
                  
              ],
              data: [75, 40, 50, 45, 20, 70],
          }]
      },

      // Configuration options go here
      options: {
          scale: {
              ticks: {
                beginAtZero: true,
                min: 0,
                max: 100,
                stepSize: 20,
              }
          },
          legend: {
              display: true,
              position: 'bottom',
              onClick: null
          },
          layout: {
              padding: 10
          }
      }
  });
}

//tooltip
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
    
//lazyload
lazyload();
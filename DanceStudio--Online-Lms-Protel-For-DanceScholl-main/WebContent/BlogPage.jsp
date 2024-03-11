<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BeatBounceX</title>
    <link rel="stylesheet" href="BlogPageStyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
       .container{
    max-width: 87%;
  }
      .btn{
        border-radius: 30px;
      }
    </style>
    <script>
      var countDownDate = new Date("may 22, 2023 17:48:25").getTime();
      var x=setInterval(function() {
          var now = new Date().getTime();
          var distance = countDownDate - now;
          var days = Math.floor(distance / (1000 * 60 * 60 * 24));
          var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
          var seconds = Math.floor((distance % (1000 * 60)) / 1000);
          
          document.getElementById("days").innerHTML = days;
          document.getElementById("hours").innerHTML = hours;
          document.getElementById("minutes").innerHTML = minutes;
          document.getElementById("seconds").innerHTML = seconds;

      }, 1000);

  </script>
</head>
<body>
    <nav>
        <input type="checkbox" id="check">
      <label for="check" class="checkbtn">
        <i class="fas fa-bars"></i>
      </label>
        <label class="logo">BeatBounceX</label>
        <ul>
        <li><a class="active" href="#">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Programs</a></li>
        <li><a href="#">Events</a></li>
        <li><a href="#">Contact Us</a></li>
        <li>
          <img src="images/login.png" alt="login" class="loginlogo">
          <a class="login" href="Login.jsp">Login/Register</a></li>
        </ul>
    </nav>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active" data-interval="5000">
            <img class="d-block w-100" src="images/Tap.jfif" alt="First slide" height="600">
          </div>
          <div class="carousel-item" data-interval="5000">
            <img class="d-block w-100" src="images/Kuchipudi.jpg" alt="Second slide" height="600">
          </div>
          <div class="carousel-item" data-interval="5000">
            <img class="d-block w-100" src="images/Hip-Hop.jpg" alt="Third slide" height="600">
          </div>
          <div class="carousel-item" data-interval="5000">
            <img class="d-block w-100" src="images/Zumba.jpg" alt="Fourth slide" height="600">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>
    <center><h1 class="EventsTag">Latest Events</h1></center>
    <div class="bubble">          
      <div class="drop">
          <div class="Events">
                  <img src="images/dance.jpg" class="img1">
                  <h2>Dance Baby Dance</h2>
                  <h6>STARTS IN</h6>
                  <div class="time">
                      <div>
                          <p id="days">00</p>
                          <span>Days</span>
                      </div>
                      <div>
                          <p id="hours">00</p>
                          <span>Hours</span>
                      </div>
                      <div>
                          <p id="minutes">00</p>
                          <span>Minutes</span>
                      </div>
                      <div>
                          <p id="seconds">00</p>
                          <span>Seconds</span>
                      </div>
                  </div>
                  <button class="Register-btn">Register</button>
          </div>
      </div>
      <div class="drop">
        <div class="Events">
                <img src="images/dance.jpg" class="img1">
                <h2>Dance Baby Dance</h2>
                <h6>STARTS IN</h6>
                <div class="time">
                    <div>
                        <p id="days">00</p>
                        <span>Days</span>
                    </div>
                    <div>
                        <p id="hours">00</p>
                        <span>Hours</span>
                    </div>
                    <div>
                        <p id="minutes">00</p>
                        <span>Minutes</span>
                    </div>
                    <div>
                        <p id="seconds">00</p>
                        <span>Seconds</span>
                    </div>
                </div>
                <button class="Register-btn">Register</button>
        </div>
    </div>
    <div class="drop">
      <div class="Events">
              <img src="images/dance.jpg" class="img1">
              <h2>Dance Baby Dance</h2>
              <h6>STARTS IN</h6>
              <div class="time">
                  <div>
                      <p id="days">00</p>
                      <span>Days</span>
                  </div>
                  <div>
                      <p id="hours">00</p>
                      <span>Hours</span>
                  </div>
                  <div>
                      <p id="minutes">00</p>
                      <span>Minutes</span>
                  </div>
                  <div>
                      <p id="seconds">00</p>
                      <span>Seconds</span>
                  </div>
              </div>
              <button class="Register-btn">Register</button>
      </div>
  </div>
  </div>
     <div class="container">
      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
          <a href="#" class="btn btn-lg btn-primary">
            Read More!
          </a>
        </div>
        <div class="col-md-5">
            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" src="images/slider-3.jpg" alt="First slide">
        </div>
      </div>

      <hr class="featurette-divider">
  
      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
          <a href="#" class="btn btn-lg btn-primary">
            Read More!
          </a>
        </div>
        <div class="col-md-5">
            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" src="images/slider-1.jpg" alt="First slide">
        </div>
      </div>
  
      <hr class="featurette-divider">
  
      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
          <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
          <a href="#" class="btn btn-lg btn-primary">
            Read More!
          </a>
        </div>
        <div class="col-md-5">
            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" src="images/slider-2.jpg" alt="First slide">
        </div>
      </div>
    </div> 
      <hr class="featurette-divider">
  
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</section>
</body>
</html>
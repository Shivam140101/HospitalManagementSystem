<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital</title>
    <style>
        .doct4{
          height: 20rem;
          position: relative;
          top: 2rem;
          left: 1.5rem;
        }
    </style>
    <%@ include file = "components/allcss.jsp"%>
  </head>
  <body>

  <%@ include file = "components/navbar.jsp"%>


    <main>
      <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="1"
            aria-label="Slide 2"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="2"
            aria-label="Slide 3"
          ></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="images/hos1.jpg"
              class="d-block w-100"
              height="690px"
              alt="..."
            />
          </div>
          <div class="carousel-item">
            <img
              src="images/hos2.jpg"
              class="d-block w-100"
              height="690px"
              alt="..."
            />
          </div>
          <div class="carousel-item">
            <img
              src="images/hos3.jpg"
              class="d-block w-100"
              height="690px"
              alt="..."
            />
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </main>

    <div class="container p-3">
      <p class="text-center fs-2">Key Features of our Hospital</p>
      <div class="row">
        <div class="col-md-8 p-5">
          <div class="row">
            <div class="col-md-6">
              <div class="card paint-card">
                <div class="card-body">
                  <p class="fs-5">100% Safety</p>
                  <p>
                    lorem ipsum dolor sit amet, consectetur adipiscing elit
                    Voluptatem, inventore
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card paint-card">
                <div class="card-body">
                  <p class="fs-5">Clean Enviroment</p>
                  <p>
                    lorem ipsum dolor sit amet, consectetur adipiscing elit
                    Voluptatem, inventore
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card paint-card">
                <div class="card-body">
                  <p class="fs-5">Friendly Doctor</p>
                  <p>
                    lorem ipsum dolor sit amet, consectetur adipiscing elit
                    Voluptatem, inventore
                  </p>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card paint-card">
                <div class="card-body">
                  <p class="fs-5">Medical Research</p>
                  <p>
                    lorem ipsum dolor sit amet, consectetur adipiscing elit
                    Voluptatem, inventore
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <img src="images/doc4.jpeg" class="doct4" />
        </div>
      </div>
    </div>

    <hr>

    <div class="container p2">
      <p class="text-center fs-2">Our Team</p>
      <div class="row">
        <div class="col-md-3">
          <div class="card paint-card">
            <div class="card-body text-center">
              <img src="images/doc1.jpeg" width="250px" height="300px">
              <p class="fw-bold fs-5">Samuani Simi</p>
              <p class="fs-7">(CEO & Chairman)</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card paint-card">
            <div class="card-body text-center">
              <img src="images/doc2.jpeg" width="250px" height="300px">
              <p class="fw-bold fs-5">Dr. Niuise Paule</p>
              <p class="fs-7">(Chief Doctor)</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card paint-card">
            <div class="card-body text-center">
              <img src="images/doc3.jpeg" width="250px" height="300px">
              <p class="fw-bold fs-5">Dr. Siva Sharma</p>
              <p class="fs-7">(CEO & Chairman)</p>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card paint-card">
            <div class="card-body text-center">
              <img src="images/doc4.jpeg" width="250px" height="300px">
              <p class="fw-bold fs-5">Dr. Mathue Samuel</p>
              <p class="fs-7">(CEO & Chairman)</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <%@ include file = "components/footer.jsp" %>



    <script src="app.js"></script>
  </body>
</html>

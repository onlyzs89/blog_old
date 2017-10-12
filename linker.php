<?php
// DB
require_once 'DB.php';
$pdo = getDB();


$tags = htmlspecialchars($_GET["tags"]);

if(!$tags){
  header("HTTP/1.0 404 Not Found");
  print(file_get_contents("404"));
  exit;
}else{
  $query = $pdo->prepare('SELECT * FROM tags WHERE del=0 AND id=' . $tags);
  $query->execute();
  $tag_item = $query->fetch();
  
  $blogs=explode(",",$tag_item["blogs"]);
  
  $content = [];
  foreach($blogs as $blog){
    $query = $pdo->prepare('SELECT * FROM main WHERE id=' . $blog);
    $query->execute();
    $blog_item = $query->fetch();
    #$url = str_replace("-", "", $blog_item["start_date"]);
    if($blog_item) $content[] = $blog_item;
  }
}

?>

<!DOCTYPE html>
<html lang="ja">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Zhang-s">

    <title><?php echo "関連山行-" . $tag_item["name"]; ?></title>
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" type="text/css">
    
    <link href="assets/css/index.css" rel="stylesheet" type="text/css">
    <style>
    .links line {
      stroke: #999;
      stroke-opacity: 0.6;
    }

    .nodes circle {
      //opacity: 0.8;
    }
    </style>
  </head>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href=""><?php echo "関連山行-" . $tag_item["name"]; ?></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="../list.html">山行一覧</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../list_100.html">百名山登頂記録</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../list_200.html">二百名山登頂記録</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../list_300.html">三百名山登頂記録</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Post Content -->
    <div>
      <svg></svg>
      <p class="copyright text-muted footer">Copyright &copy; 2017 <a href="../index.html" target="_blank">onlyzs</a> | All Rights Reserved</p>
    </div>
    
    <!-- d3js -->
    <script src="assets/js/d3.min.js"></script>
    <script src="http://d3js.org/topojson.v1.min.js"></script>
    <script src="assets/js/d3.tip.js"></script>
    
    <!-- Bootstrap core JavaScript -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script>
    // D3.js
    window.onresize = window_load;

    var width = window.innerWidth-7;
    var height = window.innerHeight-7;

    var svg = d3.select("svg").attr("width", width).attr("height", height);  
    
    // background
    svg.append("defs")
      .append("pattern")
      .attr('patternUnits', 'userSpaceOnUse')
      .attr("id", "bg")
      .attr('width', 190)
      .attr('height', 190)
      .append("image")
      .attr("xlink:href", "assets/img/bg.png")
      .attr('width', 190)
      .attr('height', 190);
    svg.append("rect")
      .attr("width", "100%")
      .attr("height", "100%")
      .attr("fill", "url(#bg)");
      
    var g = svg.append('g');
    var blogs = <?php echo json_encode($content);?>;
    var color20 = d3.scaleOrdinal(d3.schemeCategory20);

    var simulation = d3.forceSimulation()
      .force("link", d3.forceLink().id(function(d) { return d.id; }))
      .force("charge", d3.forceManyBody())
      .force("center", d3.forceCenter(width/2, height/2));
    
    // nodes & links
    var nodes = [{
      "r":Math.floor(Math.random()*(150-100)+100),
      "id":0,
      "lab":<?php echo "'" . $tag_item["name"] . "'"; ?>,
      "size":50,
      "x": width/2,
      "y": height/2,
    }];
    
    var links = [];
    console.log(blogs); 
    blogs.forEach(function(e,i,a){
      var url=e["start_date"].split('-').join('');
      var r = Math.floor(Math.random()*(50-30)+30);
      var strLen = e["mountain"].length;
      nodes.push({
        "r":r,
        "id":e["id"],
        "lab":"<a href="+url+" target='_blank'><tspan dy=-0.5em dx="+(1.25-0.25*strLen)+"em>"+e["mountain"]+"</tspan><tspan dy=1.2em dx="+(-2.5-0.5*strLen)+"em>"+e["start_date"]+"</tspan></a>",
        //"lab":e["mountain"],
        "x": width/2,
        "y": height/2,
        "size":r/3
      })
      links.push({
        "source":e["id"],
        "target":0,
        "dist":Math.floor(Math.random()*(250-200)+200)
      });
    });
    
    // circle & lines
    var lines = svg.append("g")
      .attr("class", "links")
      .selectAll("line")
      .data(links)
      .enter().append("line")
      .attr("stroke-width", 2);
      
    var g = svg.append("g")
      .attr("class", "nodes")
      .selectAll("circle")
      .data(nodes)
      .enter()
      .append("g")
      
      
    var circles = g.append("circle")
      .attr("r", function(d) { return d.r;})
      .attr("fill", function(d) { return color20(Math.floor(Math.random()*20));})
      .call(d3.drag()
        .on("start", dragstarted)
        .on("drag", dragged)
        .on("end", dragended));
      
    
    var circles_text = g.append("text")
      .attr('text-anchor', "middle")
      .attr('font-size', function(d){return d.size})
      .attr('dy', ".35em")
      .html(function(d){return d.lab});
    
    
    simulation
      .nodes(nodes)
      .on("tick", ticked);

    simulation.force("link")
      .links(links)
      .distance(function(d){return d.dist});
      
    function ticked() {
      lines
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

      circles
        .attr("cx", function(d) { return d.x; })
        .attr("cy", function(d) { return d.y; });
        
      circles_text
        .attr("x", function(d) { return d.x; })
        .attr("y", function(d) { return d.y; });

      //nodes[0].x = width/2;
      //nodes[0].y = height/2;
    }
    
    function dragstarted(d) {
      if (!d3.event.active) simulation.alphaTarget(0.5).restart();
      d.fx = d.x;
      d.fy = d.y;
    }

    function dragged(d) {
      d.fx = d3.event.x;
      d.fy = d3.event.y;
    }

    function dragended(d) {
      if (!d3.event.active) simulation.alphaTarget(0);
      d.fx = null;
      d.fy = null;
    }
    
    
    // svgのみをリサイズ
    function window_load(){
      width = window.innerWidth-7;
      height = window.innerHeight-7;
      svg.attr("width", width).attr("height", height);
    }
    
    </script>
  </body>
</html>
<?php
// DB
require_once 'DB.php';
$pdo = getDB();

$query = $pdo->prepare('SELECT * FROM main WHERE del=0 ORDER BY conquer_date DESC');
$query->execute();
$source = $query->fetchAll();

$latest_item = $source[0];

?>

<!DOCTYPE html>
<html lang="ja">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Zhang-s">

    <title>山行マップ</title>
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" type="text/css">
    
    <link href="assets/css/index.css" rel="stylesheet" type="text/css">
  </head>

  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href=""><img src="assets/img/favicon.ico" width="25px" /> 山行マップ</a>
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
    
    <div>
      <svg></svg>
      <p class="copyright text-muted footer">Copyright &copy; 2017 <a href="../index.html" target="_blank">onlyzs</a> | All Rights Reserved</p>
    </div>
    <div id="slideR">
      <h4 id="title">山行リスト</h4>
      <table id="list" class="table table-striped table-condensed listTable" style="display:none;">
        <tbody>
          <?php foreach($source as $item){?>
          <tr class="list-item" id=<?php echo $item["id"];?>>
            <th><?php echo $item["mountain"];?></th>
            <td><?php echo $item["conquer_date"];?></td>
          </tr>
          <?php };?>
        </tbody>
      </table>
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
    var mountains = <?php echo json_encode($source);?>;
    var color20 = d3.scaleOrdinal(d3.schemeCategory20);

    var div = d3.select("body").append("div")	
    .attr("class", "tooltip")				
    .style("opacity", 0);
    
    d3.json("assets/data/japan_topojson.json", function(error, jp) {
      var geoJp = topojson.feature(jp, jp.objects.ne_10m_admin_1_states_provinces);
      init_map(geoJp);
    });
    
    //scale ratio
    var trans = d3.zoomTransform(self.svg.node()); 
    
    // tip
    var tip = d3.tip().attr('class', 'd3-tip card').direction('s')
    
    function init_map(geoJp){
      // tip
      function showtip_click(d,i){
        mercator.center([ d.lon, d.lat ]);
        geopath.projection(mercator);
        map.attr("d", geopath);
        
        trans.k=2;
        trans.x=-mercator([d.lon, d.lat-1])[0];
        trans.y=-mercator([d.lon, d.lat-1])[1];
        g.attr('transform', trans);
        
        marks.attr('points', function(d){
          var x=mercator([d.lon, d.lat])[0];
          var y=mercator([d.lon, d.lat])[1];
          var r;
          switch(d.classify){
            case "1": r=(3+d.alt/5000)*2;break;
            case "2": r=(2.8+d.alt/5000)*2;break;
            case "3": r=(2.5+d.alt/5000)*2;break;
            case "4": r=(2+d.alt/5000)*2;break;
            default: r=(1.8+d.alt/5000)*2;
          }
          return x+","+(y-r/Math.sqrt(3))+" "+(x+r/Math.sqrt(3))+","+(y+r/Math.sqrt(3)/2)+" "+(x-r/Math.sqrt(3))+","+(y+r/Math.sqrt(3)/2);
        })
        var strLen = d.mountain.length;
        var text = 
          '<div class="card-block"> \
            <h4 class="card-title"><span style="font-size:'+(140-8*strLen)+'%">'+d.mountain+' <span style="font-size:60%;">'+d.alt+'m</span></span></h4> \
            <h6 class="card-subtitle mb-2 text-muted">'+d.conquer_date+'</h6> \
            <p class="card-text">'+d.text+'</span></p> \
          </div>';
        if(d.posted==1){
          text = '<a href='+d.start_date.split('-').join('')+' target="_blank"> \
          <img class="card-img-top" src="assets/img/'+d.start_date.split('-').join('')+'/1.jpg"></a>'+text;
        }
        tip.html(text).show(d,i);
      }
      
      function showtip_mouseover(d,i){
        var strLen = d.mountain.length;
        var text = 
          '<div class="card-block"> \
            <h4 class="card-title"><span style="font-size:'+(140-8*strLen)+'%">'+d.mountain+' <span style="font-size:60%;">'+d.alt+'m</span></span></h4> \
            <h6 class="card-subtitle mb-2 text-muted">'+d.conquer_date+'</h6> \
            <p class="card-text">'+d.text+'</span></p> \
          </div>';
        if(d.posted==1){
          text = '<a href='+d.start_date.split('-').join('')+' target="_blank"> \
          <img class="card-img-top" src="assets/img/'+d.start_date.split('-').join('')+'/1.jpg"></a>'+text;
        }
        tip.html(text).show(d,i);
      }
      //geojp
      var mercator = d3.geoMercator()
        .center([ <?php echo $source[0]["lon"];?>, <?php echo $source[0]["lat"];?> ])
        .translate([width/2, height/2])
        .scale(5000);
      var geopath = d3.geoPath().projection(mercator);
        
      var map = g.selectAll("path")
          .data(geoJp.features) // geojsonのすべての県の座標データを読み込む。
          .enter().append("path")
          .attr("class", function(d) { return d.id; })
          .attr("d", geopath) // geojsonからpath要素に変換する。
          .attr('fill', "black")
          .attr("fill-opacity", 0.6);
      
      var marks = g.selectAll("polygon")
        .data(mountains)
        .enter()
        .append('polygon')
        .style('fill', function(d){
          switch(d.classify){
            case "1": return '#ff1493';break;
            case "2": return '#00ff00';break;
            case "3": return '#00bfff';break;
            case "4": return '#ff8c00';break;
            default: return '#ffe4b5';
          }
        })
        .style("opacity", 0.8)
        .attr('points', function(d){
          var r;
          switch(d.classify){
            case "1": r=3+d.alt/5000;break;
            case "2": r=2.8+d.alt/5000;break;
            case "3": r=2.5+d.alt/5000;break;
            case "4": r=2+d.alt/5000;break;
            default: r=1.8+d.alt/5000;
          }
          var x=mercator([d.lon, d.lat])[0];
          var y=mercator([d.lon, d.lat])[1];
          return x+","+(y-r/Math.sqrt(3))+" "+(x+r/Math.sqrt(3))+","+(y+r/Math.sqrt(3)/2)+" "+(x-r/Math.sqrt(3))+","+(y+r/Math.sqrt(3)/2);
        })
        .attr('id', function(d){return "maker_"+d.id;})
        .on('mouseover', showtip_mouseover)
        .on('click', showtip_click)
      
      map.call(tip)    
      svg.on('click', tip.hide);
      
      var zoom = d3.zoom().on('zoom', function(d){   
        trans = d3.event.transform;
        g.attr('transform', trans);
        marks.attr('points', function(d){
          var x=mercator([d.lon, d.lat])[0];
          var y=mercator([d.lon, d.lat])[1];
          var r;
          switch(d.classify){
            case "1": r=(3+d.alt/5000)*4/trans.k;break;
            case "2": r=(2.8+d.alt/5000)*4/trans.k;break;
            case "3": r=(2.5+d.alt/5000)*4/trans.k;break;
            case "4": r=(2+d.alt/5000)*4/trans.k;break;
            default: r=(1.8+d.alt/5000)*4/trans.k;
          }
          return x+","+(y-r/Math.sqrt(3))+" "+(x+r/Math.sqrt(3))+","+(y+r/Math.sqrt(3)/2)+" "+(x-r/Math.sqrt(3))+","+(y+r/Math.sqrt(3)/2);
        })
        tip.hide(d);
      });
      svg.call(zoom); 
      
      // show latest tip
      $(<?php echo "'#maker_" . $latest_item["id"] . "'";?>).d3Click();
    }
    
    // svgのみをリサイズ
    function window_load(){
      width = window.innerWidth-7;
      height = window.innerHeight-7;
      svg.attr("width", width).attr("height", height);
    }
    
    jQuery.fn.d3Click = function () {
      this.each(function (i, e) {
        var evt = new MouseEvent("click");
        e.dispatchEvent(evt);
      });
    };
    
    $(".list-item").on('click',function(){
      $("#maker_"+$(this).attr("id")).d3Click();
    });
    
    </script>
  </body>
</html>
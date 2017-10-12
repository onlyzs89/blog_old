<?php
// DB
require_once 'DB.php';
$pdo = getDB();

$query = $pdo->prepare('SELECT * FROM main WHERE id=1');
$query->execute();
$item = $query->fetch();

$mountain=$item["mountain"];
$start_date=$item["start_date"];
$end_date=$item["end_date"];
$img_url=str_replace("-", "", $start_date);
$tags=explode(",",$item["tags_ids"]);

?>


<!DOCTYPE html>
<html lang="ja">
  
  <?php include_once 'head.php'; ?>

  <body>

    <?php include_once 'nav.php'; ?>
    
    <!-- Header -->
    <div id="carouselHeader" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
          <img class="d-block img-fluid" src=<?php echo "assets/img/" . $img_url . "/1.jpg"?>>
          <div class="carousel-caption ca-caption">
            <h1><?php echo $mountain;?></h1>
              <h4>頂上は完全に秋になりました。</h4>
          </div>
        </div>
        <div class="carousel-item">
          <img class="d-block img-fluid" src=<?php echo "assets/img/" . $img_url . "/2.jpg"?>>
          <div class="carousel-caption ca-caption">
            <h1><?php echo $mountain;?></h1>
              <h4>曇りでなければ、絶景の湿原</h2>
          </div>
        </div>
        <div class="carousel-item">
          <img class="d-block img-fluid" src=<?php echo "assets/img/" . $img_url . "/3.jpg"?>>
          <div class="carousel-caption ca-caption">
            <h1><?php echo $mountain;?></h1>
              <h4>やせ尾根</h2>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselHeader" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselHeader" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <!-- Post Content -->
    <article>
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mx-auto">
          <table class="table table-responsive info">
            <tbody>
              <tr>
                <th style="border-top-style:none;">山域</th>
                <td style="border-top-style:none;"><?php echo $mountain;?></td>
              </tr>
              <tr>
                <th>日付</th>
                <?php if($end_date==null){ ?>
                <td><?php echo $start_date;?></td>
                <?php }else{ ?>
                <td><?php echo $start_date . '~' . $end_date;?></td>
                <?php } ?>
              </tr>
              <tr>
                <th>アクセス</th>
                <td>
                    往：<span class="small">大宮
                    <i class="fa fa-subway" aria-hidden="true" data-toggle="tooltip" title="前日12:06発13:12着"></i>
                    浦佐 
                    <i class="fa fa-bus" aria-hidden="true" data-toggle="tooltip" title="前日13:40発15:00着"></i>
                    奥只見
                    <i class="fa fa-ship" aria-hidden="true" data-toggle="tooltip" title="前日15:20発16:00着"></i>
                    尾瀬口
                    <i class="fa fa-bus" aria-hidden="true" data-toggle="tooltip" title="前日16:05発16:10着"></i>
                    鷹ノ巣</span>
                    <br />
                    復：<span class="small">鷹ノ巣
                    <i class="fa fa-bus" aria-hidden="true" data-toggle="tooltip" title="15:52発16:05着"></i>
                    尾瀬口
                    <i class="fa fa-ship" aria-hidden="true" data-toggle="tooltip" title="16:10発16:50着"></i>
                    奥只見
                    <i class="fa fa-bus" aria-hidden="true" data-toggle="tooltip" title="17:10発18:30着"></i>
                    浦佐
                    <i class="fa fa-subway" aria-hidden="true" data-toggle="tooltip" title="18:48発19:46着"></i>
                    大宮</span>
                </td>
              </tr>
              <tr>
                <th>ルート</th>
                <td>
                    <span class="small"><span data-toggle="tooltip" title="03:45">鷹ノ巣〔清四郎小屋前泊〕</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                    <span data-toggle="tooltip" title="04:00">平ヶ岳登山口</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                    <span data-toggle="tooltip" title="05:23">下台倉山</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                    <span data-toggle="tooltip" title="05:56">台倉山</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                    <span data-toggle="tooltip" title="07:35">平ヶ岳</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                    <span data-toggle="tooltip" title="11:20">平ヶ岳登山口</span>
                    <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                    <span data-toggle="tooltip" title="11:40">鷹ノ巣</span></span>
                </td>
              </tr>
              <tr>
                <th>天気</th>
                <td><i class="wi wi-day-rain"></i></td>
              </tr>
              <tr>
                <th>備考</th>
                <td><span class="small">奥只見から鷹ノ巣までの船とバスは予約が必要ですが、非繁忙期には予約なくても乗れると思います。</span></td>
              </tr>
            </tbody>
          </table>
          </div>
            
          <div class="col-lg-5 mx-auto chart-info">
            <canvas id="sumChart"></canvas>
          </div>
          
          <hr width="80%">
          
          <div class="col-lg-8 col-md-10 mx-auto">
            <p>　現時点、本州で登れる最後の百名山です。三年をかけて、いよいよ最終戦に入るって感じですね。</p>
            <p>　船とバスの予約は2週間前に取りました。天気は微妙だけど、大雨を降る程度ではないので、決行しました。
            時期はまだ早いのせいかな、行きと帰りとも、私を含めて、乗客は2人しかいませんでした。秋に入ったら、多少増えるかもしれません。</p>
            <p>　元々テント泊の計画でしたが、雨を降る可能性があるから、出発前日に清四郎小屋の予約を取りました。</p>

            <h2 class="section-heading">真っ暗なやせ尾根</h2>
            <p>　4時に小屋から出発する予定でしたが、隣部屋の登山者に起こされたので、予定より20分早く出発しました。</p>
            <p>　やせ尾根に着いた時、「こんな道もあるね。」って怖いながら、楽しんで登りました。
            下台倉山辺りからは、いよいよ明るくなりました。下台倉山からの登山道は難しいところはなくて、気持ちよくて頂上に着きました。</p>
            <p>　時間早いので、途中は一人も会えませんでした。下りは20人程とすれ違いました。</p>
            
            <h2 class="section-heading">湿原の頂上</h2>
            <p>　池ノ岳から頂上までは平坦な湿原です。風が強くて、寒かったです。</p>
            <a href=<?php echo "assets/img/" . $img_url . "/4.jpg"?>>
              <img class="img-fluid lazyload" data-src=<?php echo "assets/img/" . $img_url . "/4.jpg"?>>
            </a>
            <span class="caption text-muted">地味な頂上</span>
            <p>　頂上標識は最高点ではないらしいです。木道でもう少し進んだら、最高点につきました。</p>
            <a href=<?php echo "assets/img/" . $img_url . "/1.jpg"?>>
              <img class="img-fluid lazyload" data-src=<?php echo "assets/img/" . $img_url . "/1.jpg"?>>
            </a>
            <span class="caption text-muted">秋の気配</span>
            <a href=<?php echo "assets/img/" . $img_url . "/2.jpg"?>>
              <img class="img-fluid lazyload" data-src=<?php echo "assets/img/" . $img_url . "/2.jpg"?>>
            </a>
            <span class="caption text-muted">曇りでなければ、絶景の湿原になります。</span>
            
            <p>　帰りは人がだんだん増えていた。台倉山からまだ静かに戻りました。
            天気も徐々に良くなって、顔をずっと出さない燧ヶ岳を見ながら、やせ尾根へ戻りました。</p>
            <a href=<?php echo "assets/img/" . $img_url . "/3.jpg"?>>
              <img class="img-fluid lazyload" data-src=<?php echo "assets/img/" . $img_url . "/3.jpg"?>>
            </a>
            <span class="caption text-muted">やせ尾根</span>
            <p>　「朝はこんな道歩いたか」って笑いながら、慎重に下りました。</p>
            
            <h2 class="section-heading">虹</h2>
            <p>　清四郎小屋で時間をつぶして、帰りのバスに乗りました。</p>
            <p>　奥只見湖で二回虹を見えました。本当にきれいな自然からの贈り物です。</p>
            <a href=<?php echo "assets/img/" . $img_url . "/5.jpg"?>>
              <img class="img-fluid lazyload" data-src=<?php echo "assets/img/" . $img_url . "/5.jpg"?>>
            </a>
            <span class="caption text-muted">虹1</span>
            <a href=<?php echo "assets/img/" . $img_url . "/6.jpg"?>>
              <img class="img-fluid lazyload" data-src=<?php echo "assets/img/" . $img_url . "/6.jpg"?>>
            </a>
            <span class="caption text-muted">虹2</span>
            
            <p>　自然に感謝します。</p>
            
            <p class="pull-right small meta">
                <span class="meta">Posted on September 07, 2017</span>
            </p>
            <br />
            <h6 class="tags">
            <span class="block-p">
                <span><a href="../list_100.html" target="_blank"><i class="fa fa-tag" aria-hidden="true"></i>百名山</a></span>
                <?php 
                foreach($tags as $tag){ 
                  $query = $pdo->prepare('SELECT * FROM tags WHERE id=' . $tag);
                  $query->execute();
                  $tag_item = $query->fetch();
                ?>
                  <span>
                  <a href=<?php echo "linker?tags=" . $tag_item['id'];?> target="_blank"><i class="fa fa-tag" aria-hidden="true"></i><?php echo $tag_item['name']; ?></a>
                  </span>
                <?php }?>
            </span>
            <span class="pull-right block-p">
                <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://gotomountains.com/intro/blog/20170903" data-via="onlyzs89" data-hashtags="百名山">Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
            </span>
            </h6>
          </div>
        </div>
      </div>
    </article>
    <hr>

    <?php include_once 'footer.php'; ?>

  </body>

</html>

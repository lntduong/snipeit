<!doctype html>
  <html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Labels</title>
    <link rel="stylesheet" href="{{ url(asset('js/plugins/label/bootstrap.min.css')) }}">  
  </head>
  <style>
    body {
      font-family: arial, helvetica, sans-serif;
      /* width: {{ $settings->labels_pagewidth }}in; */
      height: {{ $settings->labels_pageheight }}in;
      margin: {{ $settings->labels_pmargin_top }}in {{ $settings->labels_pmargin_right }}in {{ $settings->labels_pmargin_bottom }}in {{ $settings->labels_pmargin_left }}in;
      font-size: {{ $settings->labels_fontsize }}pt;
    }

    .card.text-white.mb-3 {
      border-radius: 20px;
      background-color: #50B1F0;
    }

    .vinx-card-header {
      padding: .75rem 1.25rem;
      margin-bottom: 0;
      margin: 0 -15px -10px;
    }

    img#vinx-cart-title {
        float: left;
    }

    h5#vinx-card-title {
        float: left;
        margin-top: 10px;
        font-weight: 800;
        font-size: 17px;
    }

    span.id {
        font-size: 12px;
    }

    h5#vinx-card-name1 {
        background-color: white;
        color: black;
        height: 45px;
        text-align: center;
        margin: -15px;
        line-height: 45px;
    }

    h5#vinx-card-name2 {
        background-color: white;
        color: black;
        height: 45px;
        text-align: center;
        margin: -15px;
        line-height: 45px;
        margin-top: 20px;
    }

    .col-4 {
        background-color: white;
        margin: -15px;
        right: -18px;
    }

    .img-qrcode {
      display: block;
      margin-left: auto;
      margin-right: auto;
    }

    .vinx-card-footer {
      padding: 6.75px 0.25rem;
      background-color: white;
      margin: 0px 3px 15px;
      color: black;
    }

    h6.vinx-card-footer-title {
        color: #52B4F2;
        font-weight: 800;
    }

    @media (width: 1200px) {
      h5#vinx-card-title {
        font-size: 16px;
      }
    }
    @media (min-width: 768px) and (max-width: 805px) { 
      h5#vinx-card-title {
        font-size: 15px;
      }
    }

    @media (min-width: 320px) and (max-width: 350px) { 
      img#vinx-cart-title {
        width: 25%;
      }
      h5#vinx-card-title {
        font-size: 11px;
      }
      .img-qrcode {
        margin-left: -15px;
      }
      h5#vinx-card-name2,
      h5#vinx-card-name1 {
        font-size: 15px;
      }
      h6.vinx-card-footer-title,
      h6.vinx-card-tel,
      h6.vinx-card-email {
          font-size: 13px;
      }
    }

    @media (min-width: 351px) and (max-width: 408px) {
      img#vinx-cart-title {
        width: 25%;
      }
      h5#vinx-card-title {
          font-size: 12px;
      }
      span.id {
          font-size: 7px;
      }
      h5#vinx-card-name1,
      h5#vinx-card-name2 {
          font-size: 15px;
      }
      .img-qrcode {
          width: 90px;
          margin-left: -10px;
      }
      h6.vinx-card-footer-title,
      h6.vinx-card-tel,
      h6.vinx-card-email {
          font-size: 13px;
      }
    }
  </style>
<body>
  <?php
    $settings->labels_width = $settings->labels_width - $settings->labels_display_sgutter;
    $settings->labels_height = $settings->labels_height - $settings->labels_display_bgutter;
    // Leave space on bottom for 1D barcode if necessary
    $qr_size = ($settings->alt_barcode_enabled=='1') && ($settings->alt_barcode!='') ? $settings->labels_height - .3 : $settings->labels_height - .3;
    // Leave space on left for QR code if necessary
    $qr_txt_size = ($settings->qr_code=='1' ? $settings->labels_width - $qr_size - .1: $settings->labels_width);
    ?>
  
  <div class="row">
  @foreach ($assets as $asset)
	<?php $count++; ?>
  
    <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-4">
      <div class="card text-white mb-3" >

        <div class="vinx-card-header">
          <img src="https://www.vinx.co.jp/resource/images_eng/skin/img-logo.jpg" alt="VINX" id="vinx-cart-title">
          <h5 id="vinx-card-title">VINX Malaysia Sdn. Bhd <span class="id">(988697-D)</span></h5>
        </div>

        <div class="card-body">
          <div class="row">
            <div class="col-8">
              <h5 class="card-title" id="vinx-card-name1">{{$asset->name}} </h5>
              <h5 class="card-title" id="vinx-card-name2">{{$asset->asset_tag}}</h5>
            </div>
            <div class="col-4">
              @if($settings->qr_code=='1')
                <img src="./{{ $asset->id }}/qr_code" class="img-qrcode">
              @endif
            </div>
          </div>
        </div>

        <div class="vinx-card-footer">
          <h6 class="vinx-card-footer-title">HELP DESK CONTACT</h6>
          <h6 class="vinx-card-tel">TEL: 180018 23 66</h6>
          <h6 class="vinx-card-email">EMAIL: sr@eaonretail.com.my</h6>
        </div>

      </div>
    </div>
    @endforeach
    </div>
  </body>
    <script src="{{ url(asset('js/plugins/label/jquery-3.3.1.slim.min.js')) }}" nonce="{{ csrf_token() }}"></script>
    <script src="{{ url(asset('js/plugins/label/popper.min.js')) }}" nonce="{{ csrf_token() }}"></script>
    <script src="{{ url(asset('js/plugins/label/bootstrap.min.js')) }}" nonce="{{ csrf_token() }}"></script>
</html>
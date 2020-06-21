<div class="about-with-image">
    <div class="content-wrap">
        <h2 class="block-title left">{{ $infoblock->getTranslatedAttribute("title") }}</h2>
        <p>{!! $infoblock->getTranslatedAttribute("body")  !!}</p>

    </div>

    <img src="{{ $infoblock->getImage(true) }}" alt="">

    <div class="overlay-bg"></div>

</div>

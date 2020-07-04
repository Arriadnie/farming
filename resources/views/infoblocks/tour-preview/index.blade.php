<div class="tour-wrap">


    <img src="{{ $infoblock->getImage(true) }}" alt="">

    <div class="tour-content">
        <p class="block-title left">{{$infoblock->getTranslatedAttribute("title") }}</p>
        <p class="description">{{strip_tags($infoblock->getTranslatedAttribute('body')) }}</p>
        <a href="{{ $infoblock->button_link ? $infoblock->button_link : '#' }}" class="more"> {{ $infoblock->getTranslatedAttribute('button_title') }}</a>
    </div>

    <div class="overlay-bg"></div>

</div>

<div class="service-slide">
    <div class="service-icon">
        <img src=" {{ $item->getImage(true)  }}" alt="">
    </div>
    <p class="service-name">{{ $item->getTranslatedAttribute('title') }}</p>
    <p class="service-description">{{ $item->getTranslatedAttribute('body') }}</p>
    <a href="{{ $item->button_link ?? "#" }}" class="more">
        {{ $item->getTranslatedAttribute('button_title') ? $item->getTranslatedAttribute('button_title') : __('main.read-more') }}
    </a>
</div>


<div class="slide-wrap">
    <div class="overlay"></div>

    @if($slide->isVideo())
        <video autoplay muted loop poster="{{ $slide->getImage(true) }}" src="{{ $slide->getVideo() }}"></video>
    @else
        <img class="lozad" data-src="{{ $slide->getImage(true) }}" alt="">
    @endif

    <div class="slide-content">
        <p class="slide-title">{{ $slide->getTranslatedAttribute('title') }}</p>
        <p class="slide-subtitle">{{ $slide->getTranslatedAttribute('body') }}</p>
        @if($slide->button_link)
            <a href="{{ $slide->button_link }}" class="more">
                {{ $slide->getTranslatedAttribute('button_title') ? $slide->getTranslatedAttribute('button_title') : __('main.know-more') }}
            </a>
        @endif
    </div>
</div>

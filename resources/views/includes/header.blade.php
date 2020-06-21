<header>
    <a href="/" class="logo-wrap">
        <img src="{{ asset('/image/logo-color.png') }}" alt="">
    </a>
    <div class="main-header">
        @include('includes.header-socials')

        <div class="header-nav">

            <nav>
                {{ menu('main-navigation', 'menus/main-navigation') }}
            </nav>

        </div>
    </div>
</header>

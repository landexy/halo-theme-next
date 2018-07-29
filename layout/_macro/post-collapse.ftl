{% macro render(post) %}

  <article class="post post-type-{{ post.type | default('normal') }}" itemscope itemtype="http://schema.org/Article">
      <header class="post-header">

          <<#if options.next_other_seo?default('false')=='true'>h2<#else>h1</#if> class="post-title">
          {% if post.link %}
          <a class="post-title-link post-title-link-external" target="_blank" href="{{ url_for(post.link) }}"
             itemprop="url">
              {{ post.title or post.link }}
              <i class="fa fa-external-link"></i>
          </a>
          {% else %}
          <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">
              {% if post.type === 'picture' %}
              {{ post.content }}
              {% else %}
              <span itemprop="name">{{ post.title | default(__('post.untitled')) }}</span>
              {% endif %}
          </a>
          {% endif %}
      </<#if options.next_other_seo?default('false')=='true'>h2<#else>h1</#if>>

      <div class="post-meta">
          <time class="post-time" itemprop="dateCreated" datetime="{{ moment(post.date).format() }}" content="{{ date(post.date, config.date_format) }}">
              {{ date(post.date, 'MM-DD') }}
          </time>
      </div>
      </header>
  </article>
{% endmacro %}
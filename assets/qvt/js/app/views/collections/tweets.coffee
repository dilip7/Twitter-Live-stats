define ['marionette','cs!app/views/layouts/eachtweet'],(Marionette,TweetLayout) ->
  class NoTweetView extends Marionette.ItemView
    template : '<strong> No tweets found. </strong>'
  class TweetsLayout extends Marionette.CollectionView
    tagName :  'ul'
    #className : 'dashboard-list'
    itemView: TweetLayout
    emptyView : NoTweetView

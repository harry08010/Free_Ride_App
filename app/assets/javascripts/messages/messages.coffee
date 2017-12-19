utils =
  getConvs: ()->
    $.ajax {
      url: "/chat/convs"
      method: "GET"
    }

  sendMsg: (content)->
    $.ajax {
      url: "/chat/create"
      method: "POST"
      data: {
        msg:
          sender_id: _currentUserId
          receiver_id: _currentChaterId
          content: content
      }
    }

Vue.component 'chat-box', {
  props: ['chat', 'index']
  template: '\
    <div class="conversation-box" v-bind:data-chater-id="chat.chater.id" v-bind:data-chat-index="index" v-bind:data-chater-gender="chat.chater.gender">\
      <div class="box-header">\
        <div class="last-msg-time">\
          {{ chat.msgs[0].create_time }}\
        </div>\
        <div class="avatar-wrapper">\
          <img class="avatar" v-bind:src="chat.chater.avatar">\
        </div>\
        <div class="name">\
          {{ chat.chater.first_name }} {{ chat.chater.last_name }} ({{ chat.chater.nickname }})\
        </div>\
      </div>\
      <div class="box-bottom">\
        {{ chat.msgs[0].content }}\
      </div>\
      <span class="notification">new</span>\
    </div>\
  '
}

Vue.component 'msg-item', {
  props: ['msg','chaterAvatar', 'ownerAvatar']
  template: '\
    <div class="msg-box">\
      <div class="box-row">\
        <div class="avatar-wrapper">\
          <template v-if="msg.is_owner">
            <img class="avatar" v-bind:src="msg.ownerAvatar">\
          </template>
          <template v-else>
            <img class="avatar" v-bind:src="msg.chaterAvatar">\
          </template>
        </div>\
        <div class="content-area">\
          <span class="content">{{ msg.content }}</span>\
          <span class="timestamp">{{ msg.create_time }}</span>\
        </div>\
      </div>\
    </div>\
  '
}

$('#send-msg').on 'click', ()->
  text = $('#input-source').val()
  utils.sendMsg(text)
  .done (res)->
    location.reload()
    console.log res

chatPanel = null
msgPanel = null
new Promise (resolve, reject)->
  utils.getConvs().done (res)->
    if res.status is "success"
      data = res.data
      chats = []
      for i,c of data
        c.id = Number i
        if c.chater.gender is 'male'
          c.chater.avatar = _maleAvatars[c.chater.id % 129]
        else if c.chater.gender is 'female'
          c.chater.avatar = _femaleAvatars[c.chater.id % 114]
        chats.push c
        for m in c.msgs
          m.create_time = moment(m.created_at).calendar()
          if m.receiver_id is _currentUserId
            m.is_owner = false
          else if m.sender_id is _currentUserId
            m.is_owner = true
      resolve(chats)
    else
      console.error "Network error, cannot get messages from server!"
      reject()
.then (chats)->
    console.log chats
    chatPanel = new Vue {
      el: '#chat-panel'
      data: {chats}
      methods:
        showDetail: (e)->
          console.log e.currentTarget
          $el = $(e.currentTarget)
          window._currentChaterId = $el.data('chater-id')
          window._currentChaterGender = $el.data('chater-gender')
          if _currentChaterGender is 'male'
            window._currentChaterAvatar = _maleAvatars[_currentChaterId % 129]
          else if _currentChaterGender is 'female'
            window._currentChaterAvatar = _femaleAvatars[_currentChaterId % 114]
          chatIndex = $el.data('chat-index')
          $('#first-hint').hide()
          msgs = chats[chatIndex].msgs
          for i,msg of msgs
            msg.ownerAvatar = _currentUserAvatar
            msg.chaterAvatar = _currentChaterAvatar
          if not msgPanel
            msgPanel = new Vue {
              el: '#msg-panel'
              data: { msgs }
            }
          else
            msgPanel.msgs = chats[chatIndex].msgs
    }

module RoomsHelper
  # 最新メッセージのデータを取得して表示するメソッド
  def most_new_message_preview(room)
    message = room.direct_messages.order(updated_at: :desc).limit(1)
    message = message[0]
    if message.present?
      tag.p "#{message.message}", class: "dm_list__content__link__box__direct_message"
    else
      tag.p "[ まだメッセージはありません ]", class: "dm_list__content__link__box__direct_message"
    end
  end

  # 相手ユーザー名を取得して表示するメソッド
  def opponent_user(room)
    entry = room.entries.where.not(user_id: current_user)
    # entry[0]はuserがDMのため一人なので、配列の０にしてある。複数に通知する場合each等に変更必要
    nickname = entry[0].user.nickname
    tag.p "#{nickname}", class: "dm_list__content__link__box__nicknamename"
  end
end

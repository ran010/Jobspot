class ExportJob < ApplicationJob
  queue_as :default

  def perform(export_id, seeker)
    return if export_id.blank?

    json_content = ExportUserData.call(seeker)

    ActionCable.server.broadcast(
        "export_channel_#{export_id}",
        json_file: {
            file_name: 'data.json',
            content: json_content
        }
    )
  end
end

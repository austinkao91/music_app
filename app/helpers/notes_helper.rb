module NotesHelper
  def note_params
    params.require(:note).permit(:body)
  end
end

/** from: https://youtu.be/JoNkttD_MUs?t=3418 */

has_note :: (member : Type_Info_Struct_Member, note_name : string) -> bool {
  for member.notes if strings_match(it, cast(note_name, ^u8)) return true;
  return false;
}

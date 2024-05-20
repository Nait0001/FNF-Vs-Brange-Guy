function onUpdatePost(elapsed)
	noteCount = getProperty('unspawnNotes.length')
	for i = 0, noteCount-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'TV Sing' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
end
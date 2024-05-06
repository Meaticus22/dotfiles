MUSIC_INFO=$(osascript <<EOF
on titleCase(theString)
	set UpperFirstCharString to do shell script "echo " & character 1 of theString & " | tr [:lower:] [:upper:]"
	set theString to UpperFirstCharString & characters 2 through -1 of theString
	return theString
end titleCase

on appRunning(appName)
	if application appName is running then
		return true
	else
		return false
	end if
end appRunning

on getTrackInfo()
	set appRunning to appRunning("Spotify")
	
	if appRunning is true then
		tell application "Spotify"
			set info to get {name, artist} of current track
			return "  " & item 1 of info & " x " & item 2 of info
		end tell
	else
		return "    Spotify App Not Running "
	end if
end getTrackInfo

getTrackInfo()
EOF
)

printf "$MUSIC_INFO"


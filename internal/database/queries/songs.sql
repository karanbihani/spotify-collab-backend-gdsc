-- name: AddSong :one
INSERT INTO songs (song_uri, playlist_id)
VALUES ($1, $2)
RETURNING *;

-- name: GetAllSongs :many
SELECT * 
FROM songs
WHERE playlist_id = $1;

-- name: IncreaseSongCount :one
UPDATE songs
SET count = count + 1
WHERE song_uri = $1
RETURNING count;

-- name: DecreaseSongCount :one
UPDATE songs
SET count = count - 1
WHERE song_uri = $1
RETURNING count;

-- name: DeleteSong :exec
DELETE FROM songs
WHERE song_uri = $1;
$token = 'ENTER YOUR TOKEN';

// Create the new story
$cmd = "curl -X POST --data 'content={query}' http://alfred-notes-api.herokuapp.com/api/notes\?access_token\=".$token;
$request = shell_exec($cmd);

$response = json_decode($request, true);
echo $response['_id'];
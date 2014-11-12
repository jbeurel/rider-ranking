var ig = require('cloud/instagram-v1-1.0.js');
ig.initialize('ca2b7bf5c5b74211883ac9ae0f3d090e');

Parse.Cloud.beforeSave("Rider", function(request, response) {
    ig.searchUser({
        q: request.object.get("username"),
        count: '1'
    }).then(function (searchResponse) {
        console.log('coucou1');
        ig.getUser(searchResponse.data.data[0].id).then(function (userResponse) {
            console.log('coucou2');
            request.object.set("data", userResponse.data);
            response.success();
        });
    });
});

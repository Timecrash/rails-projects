angular.module('flapperNews')
.controller('MainCtrl', ['$scope', 'posts', function($scope, posts) {
  $scope.test = "Hello world!";
  $scope.posts = posts.posts;
  
  $scope.addPost = function() {
    if (!$scope.title || $scope.title === "") { return; }
    else {
      $scope.posts.push({
        title: $scope.title,
        link: $scope.link,
        upvotes: 0,
        comments: [
          { author: "Joseph", body: "Oh no!", upvotes: 0 },
          { author: "Josuke", body: "Great!", upvotes: 0 }
          ]
      });
      $scope.title = "";
      $scope.link = "";
    }
  };
  
  $scope.incrementUpvotes = function(post) {
    post.upvotes += 1;
  };
}]);
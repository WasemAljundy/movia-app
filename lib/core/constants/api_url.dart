class ApiUrl {
  static const baseURL =
      'https://api.themoviedb.org/3/movie/550?api_key=ecd576a3055cb9849fd3b9e04097c569';
  static const apiToken = '?api_key=ecd576a3055cb9849fd3b9e04097c569';
  static const signup = '${baseURL}auth/signup';
  static const signin = '${baseURL}auth/signin';
  static const trendingMovies = 'https://api.themoviedb.org/3/trending/all/week?api_key=ecd576a3055cb9849fd3b9e04097c569';
  static const nowPlayingMovies = 'https://api.themoviedb.org/3/movie/now_playing?api_key=ecd576a3055cb9849fd3b9e04097c569';
  static const popularTV = 'https://api.themoviedb.org/3/tv/popular?api_key=ecd576a3055cb9849fd3b9e04097c569';
  static const movie = 'https://api.themoviedb.org/3/movie/';
  static const tv = '${baseURL}tv/';
  static const search = '${baseURL}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}

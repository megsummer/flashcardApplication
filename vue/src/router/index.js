import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import AdminDeckView from '../views/adminDeckView.vue';
import CardByIdView from '../views/CardByIdView.vue';
import CreateCardView from '../views/CreateCardView.vue';
import CreateDeckView from '../views/CreateDeckView.vue';
import SearchCardView from '../views/SearchCardView.vue';
import MyDecksView from '../views/MyDecksView.vue';
import StudySessionView from '../views/StudySessionView.vue';
import DeckByIdView from '../views/DeckByIdView.vue';
import GuestDeckView from '../views/GuestDeckView.vue';




/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
    
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    
  },
  {
    path: '/myDecks',
    name: 'myDecks',
    component: MyDecksView,
    
  },
  { 
    path: "/decks/new",
    name: "createDeck",
    component: CreateDeckView, 
  },
  { 
    path: "/cards/new",
    name: "createCard",
    component: CreateCardView, 
  },
  { 
    path: "/searchCards",
    name: "searchCards",
    component: SearchCardView, 
  },
  { 
    path: "/decks/admin",
    name: "adminDecks",
    component: AdminDeckView, 
  },{ 
    path: "/guest",
    name: "guest",
    component: GuestDeckView, 
  },
  { 
    path: "/decks/:id",
    name: "deckById",
    component: DeckByIdView, 
    
  },
  { 
    path: "/cards/:id",
    name: "cardById",
    component: CardByIdView, 
    
  },
  { 
    path: "/studysession/:id",
    name: "studySession",
    component: StudySessionView,
  } 
];

// Create the router
const router = createRouter({
  history: createWebHistory(),
  routes: routes
});

router.beforeEach((to) => {

  // Get the Vuex store
  const store = useStore();

  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    return {name: "login"};
  }
  // Otherwise, do nothing and they'll go to their next destination
});

export default router;
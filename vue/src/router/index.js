import { createRouter as createRouter, createWebHistory } from 'vue-router'
import { useStore } from 'vuex'

// Import components
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import LogoutView from '../views/LogoutView.vue';
import RegisterView from '../views/RegisterView.vue';
import DeckView from '../views/DeckView.vue';
import CardView from '../views/CardView.vue';

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
    meta: {
      requiresAuth: true
    }
  },
  {
    path: "/login",
    name: "login",
    component: LoginView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/logout",
    name: "logout",
    component: LogoutView,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: RegisterView,
    meta: {
      requiresAuth: false
    }
  },
  { 
    path: "/decks",
    name: "getAllDecks",
    component: DeckView, 
    meta: {
      requiresAuth: false
    }
  }, 
  { 
    path: "/decks/{id}",
    name: "getDecksByDeckId",
    component: DeckView, 
    meta: {
      requiresAuth: false
    }
  },
  { 
    path: "/decks/user/{id}",
    name: "getAllDecksByUserId",
    component: DeckView, 
    meta: {
      requiresAuth: false
    }
  },
  { 
    path: "/decks/new",
    name: "createDeck",
    component: DeckView, 
    meta: {
      requiresAuth: true
    }
  },
  { 
    path: "/decks/{id}",
    name: "updateDeck",
    component: DeckView, 
    meta: {
      requiresAuth: true
    }
  },
  { 
    path: "/decks/{id}",
    name: "deleteDeck",
    component: DeckView, 
    meta: {
      requiresAuth: true
    }
  },
  { 
    path: "/decks/admin",
    name: "getAllAdminDecks",
    component: DeckView, 
    meta: {
      requiresAuth: true
    }
  },
  { 
    path: "/cards",
    name: "getAllCards",
    component: CardView, 
    meta: {
      requiresAuth: false
    }
  },
  { 
    path: "/cards/{id}",
    name: "getCardById",
    component: CardView, 
    meta: {
      requiresAuth: false    
    }
  },
  { 
    path: "/cards/new",
    name: "saveCard",
    component: CardView, 
    meta: {
      requiresAuth: true
    }
  },
    { 
    path: "/cards/{id}",
    name: "updateCard",
    component: CardView, 
    meta: {
      requiresAuth: true
    }
  },
  { 
    path: "/cards/{id}",
    name: "deleteCard",
    component: CardView, 
    meta: {
      requiresAuth: true
    }
  },
  { 
    path: "/cards/{tag}",
    name: "getCardByTags",
    component: CardView, 
    meta: {
      requiresAuth: false
    }
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

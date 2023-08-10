<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'hbenfadd' );

/** Database password */
define( 'DB_PASSWORD', 'root' );

/** Database hostname */
define( 'DB_HOST', '172.16.0.2:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '&Dp5+-YP;mz,1_q<=O o+wqzu<vtOr9u=,j2({$>TJmppt|#99>/v:eHGd0AeBQ+');
define('SECURE_AUTH_KEY',  'f(LHw[1y1$;!L``xa{t|FW(C5_-+#x-.-e%=3*%S20/Kj}lB3/(][d/4hL+*suB ');
define('LOGGED_IN_KEY',    ',|->-aoe`yPVi|)vu(x&p7kP7t6.vZ7B0Gcvx %.3swk_jx5PN2hw{LO4lu.uNPZ');
define('NONCE_KEY',        'WJZ^EO0#{2ThFl=O6F[sKsIKr*Em6{]=IW`;L9Uo<i0=Dz5p/YaRK-||r]d{mqZ)');
define('AUTH_SALT',        'qVuDCsKhOlX#r`cFDenfO{+#K2l`J|/oI-gM%^`en$M26qDU^[_1g+4+1-g(E*64');
define('SECURE_AUTH_SALT', 'rD^@4eQPwNx?lb2+p45;4|kS8gXbgV,lyCUC(Zw-4U*U96l3FVkHB~po|XrhK/ws');
define('LOGGED_IN_SALT',   '&hqI5}E(?&u3WqZ; t-&yhxv+pDQakEzK>FVX+jK+y]>SS#ow;d]1J*c;zS=xVc?');
define('NONCE_SALT',       'BU2}|pV1J/sV5#-p aBtu#r AnhY7lj4zxI(=Qfn,V2L(|h^GTnxr;As?+is %C1');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
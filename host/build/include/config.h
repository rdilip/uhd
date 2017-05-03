/*
 * Copyright 2015,2016 Ettus Research LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#define HAVE_LOG2

/* Version macros */
#define UHD_VERSION_MAJOR 3
#define UHD_VERSION_API   11
/* #undef UHD_VERSION_ABI */
#define UHD_VERSION_PATCH git
#define ENABLE_USB
#ifndef UHD_VERSION
#define UHD_VERSION 3110099
#endif
